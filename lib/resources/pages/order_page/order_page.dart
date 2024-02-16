import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/controllers/order_controller.dart';
import 'package:pros_app/resources/pages/order_page/widgets/order_table_widget.dart';

import '/app/models/dish.dart';
import '/app/models/order.dart';

class OrderPage extends NyStatefulWidget<OrderController> {
  static const path = "/order";

  OrderPage() : super(path, child: _OrderPageState());
}

class _OrderPageState extends NyState<OrderPage> {
  late Order order;
  late Map<Order, Map<Dish, int>> dishes;

  @override
  boot() async {
    order = widget.data()["order"];
    dishes = await widget.controller.getDishesWithCount(
      await widget.controller.getOrders() ?? [],
    );
  }

  @override
  Widget build(BuildContext context) {
    final rows = <TableRow>[];
    dishes[order]!.forEach((key, value) {
      rows.add(_buildTableRow(key, value));
    });

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Цена: ${order.price}"),
            Text("Статус: ${order.status!}"),
            Padding(padding: EdgeInsets.all(20)),
            Center(
              child: Column(
                children: [
                  Text(
                    "Состав заказа",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  OrderTableWidget(rows: rows),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(Dish dish, int count) => TableRow(children: [
        _buildTableText(dish.title!),
        _buildTableText(count.toString()),
        _buildTableText((dish.price! * count).toString()),
      ]);

  Widget _buildTableText(String text) => Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
      );
}
