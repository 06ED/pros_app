import 'package:flutter/material.dart';
import '../../../app/models/dish.dart';
import '/app/controllers/order_controller.dart';
import '/app/models/order.dart';
import '/config/design.dart';
import 'package:nylo_framework/nylo_framework.dart';

class OrdersNavBarPage extends NyStatefulWidget<OrderController> {
  OrdersNavBarPage() : super('/orders', child: _OrdersNavBarPageState());
}

class _OrdersNavBarPageState extends NyState<OrdersNavBarPage> {
  late List<Order> orderItems;
  late Map<Order, Map<Dish, int>> dishes;

  @override
  boot() async {
    orderItems = await widget.controller.getOrders() ?? [];
    dishes = await widget.controller.getDishesWithCount(orderItems);
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
        onTap: () => _generateDialog(order),
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
                "pages.orders.status".tr() + ": ${_getStatusByOrder(order)}",
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

  void _generateDialog(Order order) {
    final rows = <TableRow>[];
    dishes[order]!.forEach((key, value) {
      rows.add(_buildTableRow(key, value));
    });

    getDialog(
      context: context,
      title: _getOrderName(orderItems.indexOf(order) + 1),
      child: Column(
        children: [
          Text("Цена: ${order.price}"),
          Text("Статус: ${_getStatusByOrder(order)}"),
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
                Table(
                  border: TableBorder.all(
                    color: Color.fromARGB(255, 30, 54, 133),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  children: [
                    TableRow(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 30, 54, 133),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        children: [
                          _buildHeaderTableText("Блюдо"),
                          _buildHeaderTableText("Кол-во"),
                          _buildHeaderTableText("Цена"),
                        ]),
                    ...rows
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getStatusByOrder(Order order) => order.status!;

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

  Widget _buildHeaderTableText(String text) => Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      );
}
