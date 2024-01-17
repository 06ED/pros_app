import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/order.dart';
import 'package:nylo_framework/nylo_framework.dart';

class OrdersNavBarPage extends NyStatefulWidget {
  OrdersNavBarPage() : super('/orders', child: _OrdersNavBarPageState());
}

class _OrdersNavBarPageState extends NyState<OrdersNavBarPage> {
  late List<Order> orderItems;

  @override
  Widget build(BuildContext context) {
    return afterLoad(
      child: () => Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: orderItems.length,
          itemBuilder: (context, index) => _buildItem(orderItems[index]),
        ),
      ),
    );
  }

  Widget _buildItem(Order order) => Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 241, 241, 241),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              "pages.orders.order".tr(
                arguments: {
                  "number": (orderItems.indexOf(order) + 1).toString(),
                },
              ),
            ),
            Text(
              "pages.orders.status".tr() +
                  ":" +
                  (order.status!
                      ? "pages.orders.status_mode.ready".tr()
                      : "pages.orders.status_mode.in_process".tr()),
            )
          ],
        ),
      );
}
