import 'package:flutter/material.dart';
import '/app/controllers/order_controller.dart';
import '/app/models/order.dart';
import 'package:nylo_framework/nylo_framework.dart';

class OrdersNavBarPage extends NyStatefulWidget<OrderController> {
  OrdersNavBarPage() : super('/orders', child: _OrdersNavBarPageState());
}

class _OrdersNavBarPageState extends NyState<OrdersNavBarPage> {
  late List<Order> orderItems;

  @override
  boot() async {
    orderItems = await widget.controller.getOrders() ?? [];
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
        onTap: () => routeTo("/order"),
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
              _getOrderName(orderItems.indexOf(order) + 1),
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
