import 'dart:convert';

import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/models/dish.dart';
import 'package:pros_app/app/networking/dishes_api_service.dart';

import '/config/storage_keys.dart';

class CartController extends NyController {
  Future<Map<Dish, int>> getCartItems() async {
    final map = <Dish, int>{};
    for (MapEntry<String, int> entry in (await _loadCart()).entries) {
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

    final cart = await _loadCart();
    cart[dish.id!] = count;
    await NyStorage.store(StorageKey.cart, cart);
  }

  Future<void> removeItem(Dish dish) async {
    final cart = await _loadCart();
    cart.remove(dish.id);

    await NyStorage.store(StorageKey.cart, cart);
  }

  Future<Map<String, int>> _loadCart() async =>
      jsonDecode(await NyStorage.read(StorageKey.cart)) as Map<String, int>;

  Future<Dish> _getDishById(String id) async =>
      await api<DishesApiService>((request) => request.fetchDishById(id));
}
