import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/models/user.dart';
import '/config/design.dart';
import '../../widgets/counter_widget.dart';
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
            Expanded(
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDishes(List<Dish> dishes) => Column(
        children: dishes.map((dish) => _buildItem(dish)).toList(),
      );

  Widget _buildItem(Dish dish) => Auth.user<User>()!.isVip
      ? Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 241, 241, 241),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dish.title!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(dish.price.toString()),
                ],
              ),
              IconButton(
                onPressed: () async {
                  int counter = 1;

                  getDialog(
                    context: context,
                    title: Text(
                      "pages.menu.count".tr(),
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 54, 133),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: CounterButton(
                            counter,
                            onPressed: (count) {
                              counter = count;
                            },
                            size: 30,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(60)),
                        TextButton(
                          onPressed: () async {
                            await widget.controller.addInCart(dish, counter);
                            Navigator.pop(context);
                            reboot();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color.fromARGB(255, 30, 54, 133)),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Создать",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                icon: CircleAvatar(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  backgroundColor: Color.fromARGB(255, 30, 54, 133),
                ),
              ),
            ],
          ),
        )
      : Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 241, 241, 241),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dish.title!,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                dish.price.toString() + "P",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        );
}
