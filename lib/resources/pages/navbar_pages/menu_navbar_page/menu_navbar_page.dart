import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/resources/widgets/refresh_indicator_widget.dart';
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
  String filter = "";

  @override
  Future<void> boot() async {
    categories = {};

    final categoryList = await widget.controller.getCategories() ?? [];
    for (Category category in categoryList) {
      final List<Dish> dishes =
          (await widget.controller.getDishesByCategory(category) ?? [])
              .where((element) =>
                  element.title!.toLowerCase().contains(filter.toLowerCase()))
              .toList();
      if (dishes.isEmpty) {
        continue;
      }
      categories[category] = dishes;
    }
  }

  @override
  Widget build(BuildContext context) {
    return afterLoad(
      child: () => PullToRefreshWidget(
        onRefresh: () => reboot(),
        child: Container(
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
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: SearchBar(
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  )),
                  leading: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 30, 54, 133),
                  ),
                  textStyle: MaterialStateProperty.all(TextStyle(
                    color: Color.fromARGB(255, 30, 54, 133),
                  )),
                  side: MaterialStateProperty.all(BorderSide(
                    color: Color.fromARGB(255, 30, 54, 133),
                  )),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  surfaceTintColor: MaterialStateProperty.all(Colors.white),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  onChanged: (value) {
                    filter = value;
                    reboot();
                  },
                ),
              ),
              _buildList,
            ],
          ),
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
              _buildDishes(categories.values.toList()[index]),
            ],
          ),
        ),
      );

  Widget _buildDishes(List<Dish> dishes) => Column(
        children: dishes.map((dish) => _buildItem(dish)).toList(),
      );

  Widget _buildItem(Dish dish) => Auth.user<User>()!.hasVipPerms
      ? VipItemCard(
          dish: dish,
          addInCart: (count, dish) async =>
              await widget.controller.addInCart(dish, count),
        )
      : DefaultItemCard(dish: dish);
}
