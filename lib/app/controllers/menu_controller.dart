import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pros_app/app/models/dish.dart';
import 'package:pros_app/app/models/menu.dart';
import 'package:pros_app/app/networking/dishes_api_service.dart';
import 'package:pros_app/app/networking/menu_api_service.dart';
import 'package:pros_app/config/storage_keys.dart';
import '../controllers/controller.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../models/category.dart';
import '../networking/categories_api_service.dart';

class MenuController extends Controller {
  @override
  construct(BuildContext context) {
    super.construct(context);
  }

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
    // Check if it in cart
    final cartItems = await NyStorage.readCollection(StorageKey.cart);

    for (dynamic item in cartItems) {
      final decodedItem = jsonDecode(item);

      if (decodedItem.keys.first == dish.id) {
        final beforeCount = decodedItem.values.first;

        // Saving to cart
        await NyStorage.deleteFromCollection(cartItems.indexOf(item),
            key: StorageKey.cart);
        await NyStorage.addToCollection(StorageKey.cart,
            item: jsonEncode({dish.id: beforeCount + count}));
        return;
      }
    }

    await NyStorage.addToCollection(StorageKey.cart,
        item: jsonEncode({dish.id: count}));
  }
}
