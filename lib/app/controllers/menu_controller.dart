import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pros_app/app/models/dish.dart';
import 'package:pros_app/app/models/menu.dart';
import 'package:pros_app/app/networking/dishes_api_service.dart';
import 'package:pros_app/app/networking/menu_api_service.dart';
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

  Future<List<Dish>?> getDishesByCategory(Category category) async {
    final nonFilteredItems = await api<DishesApiService>(
          (request) => request.fetchDishesByCategory(category),
    ) as List<Dish>;
    final inCartIds = (await NyStorage.readCollection("cart"))
        .map((e) => jsonDecode(e).keys.first)
        .toList();
    log(inCartIds.toString());

    // Filtering items cuz they can be in cart
    return nonFilteredItems
        .where((element) => !inCartIds.contains(element.id))
        .toList();
  }
}
