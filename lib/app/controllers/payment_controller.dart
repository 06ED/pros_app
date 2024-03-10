import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/networking/payment_api_service.dart';

import '../models/dish.dart';
import '../models/order.dart';

class PaymentController extends NyController {
  Future<void> createOrder(Order order) async =>
      await api<PaymentApiService>((request) => request.createOrder(order));

  Future<PaymentData> reduceCartItems(Map<Dish, int> cartItems) async {
    int cost = 0;
    List<Dish> dishes = [];

    cartItems.forEach((dish, count) {
      cost += dish.price! * count;
      for (int i = 0; i < count; i++) {
        dishes.add(dish);
      }
    });

    return PaymentData(dishes, cost);
  }
}

class PaymentData {
  final int finalConst;
  final List<Dish> dishes;

  PaymentData(this.dishes, this.finalConst);
}
