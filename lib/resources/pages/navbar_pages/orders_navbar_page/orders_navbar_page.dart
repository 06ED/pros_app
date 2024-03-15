import 'package:flutter/material.dart';
import 'package:pros_app/resources/widgets/refresh_indicator_widget.dart';
import '../../../../app/models/dish.dart';
import '/app/controllers/order_controller.dart';
import '/app/models/order.dart';
import 'package:nylo_framework/nylo_framework.dart';

class OrdersNavBarPage extends NyStatefulWidget<OrderController> {
  OrdersNavBarPage() : super('/orders', child: _OrdersNavBarPageState());
}

class _OrdersNavBarPageState extends NyState<OrdersNavBarPage> {
  late List<Order> orders;
  late Map<Order, Map<Dish, int>> dishes;

  @override
  boot() async {
    orders = await widget.controller.getOrders() ?? [];
    dishes = await widget.controller.getDishesWithCount(
      await widget.controller.getOrders() ?? [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return afterLoad(
      child: () => PullToRefreshWidget(
        onRefresh: () => reboot(),
        child: Container(
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
                  itemCount: orders.length,
                  itemBuilder: (context, index) => _buildItem(orders[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(Order order) => InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          Map<Dish, int>? dish;
          for (MapEntry<Order, dynamic> entry in dishes.entries) {
            if (entry.key.id == order.id) {
              dish = entry.value;
              break;
            }
          }
          routeTo("/order", data: {"order": order, "dishes": dish});
        },
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
              _getOrderName(order.number!),
              Text(
                "pages.orders.status".tr() + ": ${order.status!}",
              )
            ],
          ),
        ),
      );

  Widget _getOrderName(int count) => Row(
        children: [
          Text(
            "pages.orders.order".tr(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            " №$count",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color.fromARGB(255, 30, 54, 133),
            ),
          ),
        ],
      );
}
