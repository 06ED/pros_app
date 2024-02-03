import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class SberPayButton extends StatelessWidget {
  static const String _viewType = '<platform-view-type>';

  const SberPayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Image.asset(getImageAsset("sber_pay.png")),
    );
  }
}
