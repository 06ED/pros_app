import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class PaymentAppBar extends AppBar {
  final int cost;

  PaymentAppBar({
    required this.cost,
  }) : super(
          title: Text(
            "headers.payment".tr(),
            style: TextStyle(
              fontSize: 33,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Text(
                "$cost₽",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
}
