import 'dart:convert';

import 'package:pros_app/app/models/dish.dart';
import 'package:pros_app/app/models/menu.dart';
import 'package:pros_app/app/networking/dishes_api_service.dart';
import 'package:pros_app/app/networking/menu_api_service.dart';
import 'package:pros_app/config/storage_keys.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../models/category.dart';
import '../networking/categories_api_service.dart';

class MenuController extends NyController {
  Future<List<Category>?> getCategories() async {
    final todayMenu =
        (await api<MenuApiService>((request) => request.fetchMenu())) as Menu;
    return await api<CategoryApiService>(
        (request) => request.fetchCategories(todayMenu));
  }

  Future<List<Dish>?> getDishesByCategory(Category category) async =>
      await api<DishesApiService>(
        (request) => request.fetchDishesByCategory(category),
      );

  Future<void> addInCart(Dish dish, int count) async {
    final cartItems =
        jsonDecode(await NyStorage.read(StorageKey.cart)) as Map<String, int>;

    if (cartItems.containsKey(dish.id)) {
      cartItems[dish.id!] = cartItems[dish.id!]! + count;
    } else {
      cartItems[dish.id!] = count;
    }

    await NyStorage.store(StorageKey.cart, cartItems);
  }
}
