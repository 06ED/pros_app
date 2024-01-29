import 'package:flutter/material.dart';
import '../controllers/controller.dart';
import '/app/models/dish.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../networking/menu_api_service.dart';

class MenuController extends Controller {
  @override
  construct(BuildContext context) {
    super.construct(context);
  }

  Future<List<Dish>?> getDishes() async =>
      await api<MenuApiService>((request) => request.fetchMenu());
}
