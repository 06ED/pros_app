import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'widgets/default_item_card.dart';
import 'widgets/vip_item_card.dart';
import '/app/models/user.dart';
import '/app/models/category.dart';
import '/app/controllers/menu_controller.dart' as controller;
import '/app/models/dish.dart';

class MenuNavBarPage extends NyStatefulWidget<controller.MenuController> {
  MenuNavBarPage() : super('/menu', child: _MenuNavBarPageState());
}

class _MenuNavBarPageState extends NyState<MenuNavBarPage> {
  late Map<Category, List<Dish>> categories;

  @override
  Future<void> boot() async {
    categories = {};

    final categoryList = await widget.controller.getCategories() ?? [];
    for (Category category in categoryList) {
      categories[category] =
          await widget.controller.getDishesByCategory(category) ?? [];
    }
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
            _buildList,
          ],
        ),
      ),
    );
  }

  Widget get _buildList => Expanded(
    child: ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categories.keys.toList()[index].title!,
            style: TextStyle(
              color: Color.fromARGB(255, 30, 54, 133),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: _buildDishes(categories.values.toList()[index]),
          ),
        ],
      ),
    ),
  );

  Widget _buildDishes(List<Dish> dishes) => Column(
        children: dishes.map((dish) => _buildItem(dish)).toList(),
      );

  Widget _buildItem(Dish dish) => Auth.user<User>()!.isVip
      ? VipItemCard(
          dish: dish,
          addInCart: (count, dish) async =>
              await widget.controller.addInCart(dish, count),
        )
      : DefaultItemCard(dish: dish);
}