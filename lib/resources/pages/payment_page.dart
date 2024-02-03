import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class PaymentPage extends NyStatefulWidget {
  static const path = "/payment";

  PaymentPage() : super(path, child: _PaymentPageState());
}

class _PaymentPageState extends NyState<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}