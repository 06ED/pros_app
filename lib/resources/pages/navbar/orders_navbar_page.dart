import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/dish.dart';
import 'package:flutter_app/app/models/order.dart';
import 'package:nylo_framework/nylo_framework.dart';

class OrdersNavBarPage extends NyStatefulWidget {
  OrdersNavBarPage() : super('/orders', child: _OrdersNavBarPageState());
}

class _OrdersNavBarPageState extends NyState<OrdersNavBarPage> {
  late List<Order> orderItems;

  @override
  boot() {
    orderItems = [
      Order(
        cost: 200,
        time: DateTime.now(),
        status: false,
        dishes: <Dish>[
          Dish(name: "обед 1", cost: 123.2),
          Dish(name: "обед 2", cost: 283.2),
          Dish(name: "обед 3", cost: 143.24),
        ],
      ),
      Order(
        cost: 200,
        time: DateTime.now(),
        status: false,
        dishes: <Dish>[
          Dish(name: "обед 1", cost: 123.2),
          Dish(name: "обед 2", cost: 283.2),
          Dish(name: "обед 3", cost: 143.24),
        ],
      ),
      Order(
        cost: 200,
        time: DateTime.now(),
        status: false,
        dishes: <Dish>[
          Dish(name: "обед 1", cost: 123.2),
          Dish(name: "обед 2", cost: 283.2),
          Dish(name: "обед 3", cost: 143.24),
        ],
      ),
      Order(
        cost: 200,
        time: DateTime.now(),
        status: false,
        dishes: <Dish>[
          Dish(name: "обед 1", cost: 123.2),
          Dish(name: "обед 2", cost: 283.2),
          Dish(name: "обед 3", cost: 143.24),
        ],
      ),
      Order(
        cost: 200,
        time: DateTime.now(),
        status: false,
        dishes: <Dish>[
          Dish(name: "обед 1", cost: 123.2),
          Dish(name: "обед 2", cost: 283.2),
          Dish(name: "обед 3", cost: 143.24),
        ],
      ),
      Order(
        cost: 200,
        time: DateTime.now(),
        status: false,
        dishes: <Dish>[
          Dish(name: "обед 1", cost: 123.2),
          Dish(name: "обед 2", cost: 283.2),
          Dish(name: "обед 3", cost: 143.24),
        ],
      ),
      Order(
        cost: 200,
        time: DateTime.now(),
        status: false,
        dishes: <Dish>[
          Dish(name: "обед 1", cost: 123.2),
          Dish(name: "обед 2", cost: 283.2),
          Dish(name: "обед 3", cost: 143.24),
        ],
      ),
      Order(
        cost: 200,
        time: DateTime.now(),
        status: false,
        dishes: <Dish>[
          Dish(name: "обед 1", cost: 123.2),
          Dish(name: "обед 2", cost: 283.2),
          Dish(name: "обед 3", cost: 143.24),
        ],
      ),
      Order(
        cost: 200,
        time: DateTime.now(),
        status: false,
        dishes: <Dish>[
          Dish(name: "обед 1", cost: 123.2),
          Dish(name: "обед 2", cost: 283.2),
          Dish(name: "обед 3", cost: 143.24),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return afterLoad(
      child: () => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "headers.orders".tr(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              margin: EdgeInsets.only(bottom: 10),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: orderItems.length,
                itemBuilder: (context, index) => _buildItem(orderItems[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(Order order) => InkWell(
    splashColor: Colors.transparent,
    onTap: () {},
    child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 241, 241, 241),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "pages.orders.order".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    " №${orderItems.indexOf(order) + 1}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 30, 54, 133),
                    ),
                  ),
                ],
              ),
              Text(
                "pages.orders.status".tr() +
                    ": " +
                    (order.status!
                        ? "pages.orders.status_mode.ready".tr()
                        : "pages.orders.status_mode.in_process".tr()),
              )
            ],
          ),
        ),
  );
}
