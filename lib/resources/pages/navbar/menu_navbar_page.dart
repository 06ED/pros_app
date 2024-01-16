import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../../app/models/dish.dart';
import '../../../app/controllers/menu_controller.dart' as menu;

class MenuNavBarPage extends NyStatefulWidget<menu.MenuController> {
  MenuNavBarPage() : super('/menu', child: _MenuNavBarPageState());
}

class _MenuNavBarPageState extends NyState<MenuNavBarPage> {
  late List<Dish> dishes;

  @override
  boot() {
    dishes = [
      Dish(name: "обед 1", cost: 123.2),
      Dish(name: "обед 2", cost: 283.2),
      Dish(name: "обед 3", cost: 143.24),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return afterLoad(
      child: () => Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "headers.menu".tr(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              margin: EdgeInsets.only(bottom: 10),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dishes.length,
                itemBuilder: (context, index) => _buildItem(dishes[index]),
              ),
            ),
          ],
        ),
      ),
      loading: Placeholder(),
    );
  }

  Widget _buildItem(Dish dish) => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(dish.name!),
            Text(dish.cost.toString()),
          ],
        ),
      );
}
