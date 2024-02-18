import 'package:flutter/material.dart';

import '../../../../app/models/order.dart';

class OrderAppBar extends AppBar {
  final Order order;

  OrderAppBar({
    required this.order,
  }) : super(
    title: Text(
      "Заказ №${order.number}",
      style: TextStyle(
        fontSize: 23,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Color.fromARGB(255, 30, 54, 133),
    actions: [
      Container(
        padding: EdgeInsets.all(7),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Text(
          "${order.price!}₽",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ]
  );
}
