import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/controllers/order_controller.dart';

import 'widgets/order_app_bar.dart';
import 'widgets/order_table_widget.dart';

import '/app/models/dish.dart';
import '/app/models/order.dart';

class OrderPage extends NyStatefulWidget<OrderController> {
  static const path = "/order";

  OrderPage() : super(path, child: _OrderPageState());
}

class _OrderPageState extends NyState<OrderPage> {
  late Order order;
  late Map<Dish, int> dishes;

  @override
  boot() {
    order = widget.data()["order"];
    dishes = widget.data()["dishes"];
  }

  @override
  Widget view(BuildContext context) {
    final rows = <TableRow>[];
    dishes.forEach((key, value) {
      rows.add(_buildTableRow(key, value));
    });

    return Scaffold(
      appBar: OrderAppBar(order: order),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 30, 54, 133),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  order.status!,
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 30, 54, 133),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(20)),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Состав заказа",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    OrderTableWidget(rows: rows),
                  ],
                ),
              ),
            ],
          ),
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
              fontSize: 18,
            ),
          ),
        ),
      );
}
