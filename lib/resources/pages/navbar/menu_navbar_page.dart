import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../../app/controllers/menu_controller.dart' as controller;
import '../../../app/models/dish.dart';

class MenuNavBarPage extends NyStatefulWidget<controller.MenuController> {
  MenuNavBarPage() : super('/menu', child: _MenuNavBarPageState());
}

class _MenuNavBarPageState extends NyState<MenuNavBarPage> {
  late List<Dish> dishes;

  @override
  Future<void> boot() async {
    dishes = await widget.controller.getDishes() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return afterLoad(child: () => Container(
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
    ));
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
