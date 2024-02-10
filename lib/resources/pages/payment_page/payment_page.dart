import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/resources/widgets/counter_widget.dart';
import '../../../config/design.dart';
import 'widgets/payment_app_bar.dart';
import 'widgets/vip_order_widget.dart';

class PaymentPage extends NyStatefulWidget {
  static const path = "/payment";

  PaymentPage() : super(path, child: _PaymentPageState());
}

class _PaymentPageState extends NyState<PaymentPage> {
  final TextEditingController _wishController = new TextEditingController();
  int _personCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PaymentAppBar(cost: 1000),
          VipOrderWidget(),
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
                  "Количество персон",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 30, 54, 133),
                  ),
                ),
                CounterButton(
                  1,
                  size: 30,
                  onPressed: (count) => _personCounter,
                ),
              ],
            ),
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
                "Добавить желание",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(40)),
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
                "Создать заказ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(40)),
        ],
      ),
    );
  }

  void _generateDialog() => getDialog(
        context: context,
        title: Text(
          "Добавить пожелание",
          style: TextStyle(
            color: Color.fromARGB(255, 30, 54, 133),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _wishController,
                keyboardType: TextInputType.multiline,
                maxLines: 11,
                minLines: 11,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 30, 54, 133), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                ),
                style: TextStyle(
                  color: Color.fromARGB(255, 30, 54, 133),
                  fontSize: 14,
                ),
                scrollPadding: EdgeInsets.all(20.0),
                autofocus: true,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                      "Добавить",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
