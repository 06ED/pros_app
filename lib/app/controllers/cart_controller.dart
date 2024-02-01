import 'package:flutter/services.dart';
import 'package:pros_app/app/controllers/controller.dart';
import 'package:pros_app/app/models/dish.dart';

class CartController extends Controller {
  static const _sdkChannel = MethodChannel("com.spay.sdk/pay");

  Future<Map<Dish, int>?> getCartItems() async {
    return {};
  }

  Future<void> pay(double price) async {
    final arguments = {
      "merchantLogin": 'sbertest_0230',
      "orderId": '64e0754cc1e44d208376e2b2f3e6786e',
      "redirectUri": 'redirectUri',
    };
    final String result =
        await _sdkChannel.invokeMethod("payWithOrder", arguments);
  }
}
