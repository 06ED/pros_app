import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/controllers/controller.dart';
import 'package:pros_app/app/models/dish.dart';
import 'package:pros_app/app/networking/dishes_api_service.dart';

class CartController extends Controller {
  static const _sdkChannel = MethodChannel("com.spay.sdk/pay");

  Future<Map<Dish, int>> getCartItems() async {
    final map = <Dish, int>{};
    for (String item in await NyStorage.readCollection("cart")) {
      log(item);
      final decodedMap = jsonDecode(item) as Map<String, dynamic>;
      map[await getDishById(decodedMap.keys.first)] =
          decodedMap.values.first as int;
    }

    return map;
  }

  Future<Dish> getDishById(String id) async =>
      await api<DishesApiService>((request) => request.fetchDishById(id));

  Future<void> updateDishCount(Dish dish, int count) async {
    await removeItem(dish);
    await NyStorage.addToCollection(dish.id!, item: count);
  }

  Future<void> removeItem(Dish dish) async {
    final need = await NyStorage.readCollection("cart");
    final needObject = need
        .where((element) => jsonDecode(element).keys.first == dish.id)
        .first;
    await NyStorage.deleteFromCollection(need.indexOf(needObject), key: "cart");
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
