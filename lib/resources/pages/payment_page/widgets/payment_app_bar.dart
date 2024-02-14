import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class PaymentAppBar extends StatelessWidget {
  final int cost;

  const PaymentAppBar({
    super.key,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -context.widgetWidth() * 1.2,
            left: -context.widgetWidth() / 3,
            child: CircleAvatar(
              radius: context.widgetWidth() / 1.2,
              backgroundColor: Color.fromARGB(255, 30, 54, 133),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "headers.payment".tr(),
                  style: TextStyle(
                    fontSize: 33,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "$costР",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
