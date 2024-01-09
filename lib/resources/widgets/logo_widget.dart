import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, this.height, this.width}) : super(key: key);
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "logo.png",
          height: height ?? 45,
          width: width ?? 45,
        ).localAsset(),
        Text(
          "logo".tr(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
