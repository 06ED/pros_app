import 'dart:convert';

import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/controllers/controller.dart';
import 'package:pros_app/app/models/dish.dart';
import 'package:pros_app/app/networking/dishes_api_service.dart';

import '/config/storage_keys.dart';

class CartController extends Controller {
  Future<Map<Dish, int>> getCartItems() async {
    final map = <Dish, int>{};
    for (String item in await NyStorage.readCollection(StorageKey.cart)) {
      final decodedMap = jsonDecode(item) as Map<String, dynamic>;
      map[await getDishById(decodedMap.keys.first)] =
          decodedMap.values.first as int;
    }
    return Map.fromEntries(map.entries.toList()
      ..sort((e1, e2) => e1.key.title!.compareTo(e2.key.title!)));
  }

  Future<Dish> getDishById(String id) async =>
      await api<DishesApiService>((request) => request.fetchDishById(id));

  Future<void> updateDishCount(Dish dish, int count) async {
    await removeItem(dish);
    if (count <= 0) {
      return;
    }

    await NyStorage.addToCollection(StorageKey.cart,
        item: jsonEncode({dish.id!: count}));
  }

  Future<void> removeItem(Dish dish) async {
    final need = await NyStorage.readCollection(StorageKey.cart);
    final needObject = need
        .where((element) => jsonDecode(element).keys.first == dish.id)
        .first;
    await NyStorage.deleteFromCollection(need.indexOf(needObject),
        key: StorageKey.cart);
  }
}
