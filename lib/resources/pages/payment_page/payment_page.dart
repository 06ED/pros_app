import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/controllers/payment_controller.dart';
import 'package:pros_app/app/models/dish.dart';
import 'package:pros_app/app/models/order.dart';
import 'package:pros_app/app/models/user.dart';
import 'package:pros_app/resources/pages/pages.dart';
import 'package:pros_app/resources/pages/payment_page/widgets/super_vip_order_widget.dart';
import 'package:pros_app/resources/widgets/counter_widget.dart';
import 'package:pros_app/resources/widgets/dialogs/input_dialog.dart';
import 'widgets/payment_app_bar.dart';
import 'widgets/vip_order_widget.dart';

class PaymentPage extends NyStatefulWidget<PaymentController> {
  static const path = "/payment";

  PaymentPage() : super(path, child: _PaymentPageState());
}

class _PaymentPageState extends NyState<PaymentPage> {
  final TextEditingController _foodPlaceController = TextEditingController();
  final TextEditingController _wishController = TextEditingController();

  TimeOfDay? _submissionTime;

  int _personCounter = 0;
  int _finalCost = 0;

  List<Dish> _dishes = [];
  PaymentMethod paymentMethod = PaymentMethod.cache;

  Widget _currentButtonWidget = Container(
    margin: EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 30,
    ),
    child: Text(
      "pages.payment.create_order".tr(),
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
    ),
  );

  @override
  boot() async {
    final data = await widget.controller.reduceCartItems(widget.data());
    _finalCost = data.finalConst;
    _dishes.addAll(data.dishes);
  }

  @override
  Widget build(BuildContext context) {
    final user = Auth.user<User>();
    if (user!.isVip) {
      _foodPlaceController.text = "pages.payment.take_type.yourself".tr();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PaymentAppBar(cost: _finalCost),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 55,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromARGB(255, 30, 54, 133),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "pages.payment.person_count".tr(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 30, 54, 133),
                    ),
                  ),
                  CounterButton(
                    1,
                    size: 30,
                    min: 1,
                    onPressed: (count) => _personCounter,
                  ),
                ],
              ),
            ),
            user.isVip
                ? VipOrderWidget(
                    onChange: (index) {
                      _foodPlaceController.text = index == 0
                          ? "pages.payment.take_type.yourself".tr()
                          : "pages.payment.take_type.area".tr();
                    },
                  )
                : SuperVipOrderWidget(
                    controller: _foodPlaceController,
                    onChangedPayment: (method) => paymentMethod = method,
                  ),
            TextButton(
              onPressed: () => _generateDialog(),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  Color.fromARGB(255, 30, 54, 133),
                ),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 30,
                ),
                child: Text(
                  "pages.payment.add_wish".tr(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () async => _submissionTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(DateTime.now()),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  Color.fromARGB(255, 30, 54, 133),
                ),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 30,
                ),
                child: Text(
                  "pages.payment.submission_time".tr(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                final nowTime = DateTime.now();

                // Validation
                if (_submissionTime == null) {
                  _warning("Не выбрано время");
                  return;
                }
                if (_foodPlaceController.text.trim().isEmpty) {
                  _warning("Не выбрано место для еды");
                  return;
                }

                widget.controller
                    .createOrder(
                      Order(
                        dishes: _dishes,
                        price: _finalCost,
                        placeOfDelivery: _foodPlaceController.text,
                        countOfPersons: _personCounter,
                        wishes: _wishController.text,
                        paymentMethod: "pages.payment.payment_type."
                            "${paymentMethod.toString()}",
                        submissionTime: DateTime(
                          nowTime.year,
                          nowTime.month,
                          nowTime.day,
                          _submissionTime!.hour,
                          _submissionTime!.minute,
                        ),
                      ),
                    )
                    .then(
                      (value) => routeTo(
                        SuccessOrderPage.path,
                        navigationType: NavigationType.pushReplace,
                      ),
                    );
                setState(
                  () => _currentButtonWidget = Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 60,
                    ),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  Color.fromARGB(255, 30, 54, 133),
                ),
              ),
              child: AnimatedSwitcher(
                duration: Duration(seconds: 2),
                child: _currentButtonWidget,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _warning(String text) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text)),
      );

  _generateDialog() => showInputDialog(
        context: context,
        controller: _wishController,
        labelText: "pages.payment.add_wish".tr(),
        buttonText: "pages.payment.create_wish".tr(),
      );
}
