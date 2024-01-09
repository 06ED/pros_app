import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../../app/models/dish.dart';

class MenuNavBarPage extends NyStatefulWidget {
  static const path = '/home';

  MenuNavBarPage() : super(path, child: _MenuNavBarPageState());
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
    return Container(
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
              itemBuilder: (context, index) => Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(dishes[index].name!),
                    Text(dishes[index].cost.toString()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
