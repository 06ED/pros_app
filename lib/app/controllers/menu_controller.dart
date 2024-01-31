import 'package:flutter/material.dart';
import 'package:pros_app/app/models/dish.dart';
import 'package:pros_app/app/networking/dishes_api_service.dart';
import '../controllers/controller.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../models/category.dart';
import '../networking/categories_api_service.dart';

class MenuController extends Controller {
  @override
  construct(BuildContext context) {
    super.construct(context);
  }

  Future<List<Category>?> getCategories() async =>
      await api<CategoryApiService>((request) => request.fetchCategories());

  Future<List<Dish>?> getDishesByCategory(Category category) async =>
      await api<DishesApiService>(
        (request) => request.fetchDishesByCategory(category),
      );
}
