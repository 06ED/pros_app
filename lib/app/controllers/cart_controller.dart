import 'dart:convert';

import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/models/dish.dart';
import 'package:pros_app/app/networking/dishes_api_service.dart';

import '../utils/cart_mixin.dart';
import '/config/storage_keys.dart';

class CartController extends NyController with CartMixin {
  Future<Map<Dish, int>> getCartItems() async {
    final map = <Dish, int>{};
    for (MapEntry<String, dynamic> entry in (await cart).entries) {
      map[await _getDishById(entry.key)] = entry.value;
    }

    return Map.fromEntries(map.entries.toList()
      ..sort((e1, e2) => e1.key.title!.compareTo(e2.key.title!)));
  }

  Future<void> updateDishCount(Dish dish, int count) async {
    if (count <= 0) {
      await removeItem(dish);
      return;
    }

    final cartItems = await cart;
    cartItems[dish.id!] = count;
    await NyStorage.store(StorageKey.cart, jsonEncode(cartItems));
  }

  Future<void> removeItem(Dish dish) async {
    final cartItems = await cart;
    cartItems.remove(dish.id);

    await NyStorage.store(StorageKey.cart, jsonEncode(cartItems));
  }

  Future<Dish> _getDishById(String id) async =>
      await api<DishesApiService>((request) => request.fetchDishById(id));
}
