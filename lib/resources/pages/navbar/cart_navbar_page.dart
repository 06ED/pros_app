import 'package:flutter/material.dart';
import '../../../app/models/dish.dart';
import '/app/controllers/cart_controller.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CartNavBarPage extends NyStatefulWidget<CartController> {
  CartNavBarPage() : super('/cart', child: _CartNavBarPageState());
}

class _CartNavBarPageState extends NyState<CartNavBarPage> {
  late Map<Dish, int> cartItems;

  @override
  boot() async {
    cartItems = await widget.controller.getCartItems() ?? {};
  }

  @override
  Widget build(BuildContext context) {
    return afterLoad(
      child: () => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "headers.orders".tr(),
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
                itemBuilder: (context, index) =>
                    _buildItem(cartItems.keys.toList()[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(Dish dish) => Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 241, 241, 241),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dish.title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text("${dish.price}P"),
          ],
        ),
      );
}
