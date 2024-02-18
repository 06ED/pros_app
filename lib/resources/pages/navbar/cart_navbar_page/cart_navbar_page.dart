import 'package:flutter/material.dart';
import 'package:pros_app/resources/widgets/counter_widget.dart';
import '/app/models/dish.dart';
import '/app/controllers/cart_controller.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CartNavBarPage extends NyStatefulWidget<CartController> {
  CartNavBarPage() : super('/cart', child: _CartNavBarPageState());
}

class _CartNavBarPageState extends NyState<CartNavBarPage> {
  late Map<Dish, int> cartItems;

  @override
  boot() async => cartItems = await widget.controller.getCartItems();

  @override
  Widget build(BuildContext context) {
    return afterLoad(
      child: () => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                "headers.cart".tr(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              margin: EdgeInsets.only(bottom: 10),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) => _buildItem(
                  cartItems.keys.toList()[index],
                  cartItems.values.toList()[index],
                ),
              ),
            ),
            TextButton(
              onPressed: () => routeTo("/payment", data: cartItems),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  Color.fromARGB(255, 30, 54, 133),
                ),
              ),
              child: Text(
                "Заказать",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(Dish dish, int count) => Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 241, 241, 241),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              child: dish.image,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          dish.title!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(7),
                        child: Text(
                          "${dish.price}P",
                          style: TextStyle(
                            color: Color.fromARGB(255, 30, 54, 133),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromARGB(255, 30, 54, 133),
                            )),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromARGB(255, 30, 54, 133),
                      ),
                    ),
                    child: CounterButton(
                      count,
                      size: 20,
                      onPressed: (count) async {
                        await widget.controller.updateDishCount(dish, count);
                        cartItems = await widget.controller.getCartItems();

                        setState(() {});
                        if (count <= 0) {
                          reboot();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
