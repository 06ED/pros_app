import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/controllers/controller.dart';
import 'package:pros_app/app/networking/payment_api_service.dart';

import '../models/dish.dart';
import '../models/order.dart';

class PaymentController extends Controller {
  Future<void> getDishItems(Map<Dish, int> cartItems) async {
    final items = <Dish>[];
    double totalSum = 0;
    cartItems.forEach((dish, count) {
      totalSum += dish.price! * count;
      for (int i = 0; i < count; i++) {
        items.add(dish);
      }
    });
  }

  Future<void> createOrder(Order order) async =>
      await api<PaymentApiService>((request) => request.createOrder(order));
}
