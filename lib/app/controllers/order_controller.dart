import '../models/dish.dart';
import '/app/models/order.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../networking/orders_api_service.dart';

class OrderController extends NyController {
  Future<List<Order>?> getOrders() async =>
      await api<OrdersApiService>((request) => request.fetchOrders());

  Future<Map<Order, Map<Dish, int>>> getDishesWithCount(
      List<Order> orders) async {
    final Map<Order, Map<Dish, int>> dishes = {};

    for (Order element in orders) {
      final counts = <String, int>{};

      for (String el in element.dishes!.map((e) => e.id!).toList()) {
        if (!counts.containsKey(el)) {
          counts[el] = 1;
        } else {
          counts[el] = counts[el]! + 1;
        }
      }

      dishes[element] = counts.map((key, value) => MapEntry(
            element.dishes!.where((element) => element.id == key).first,
            value,
          ));
    }
    return dishes;
  }
}
