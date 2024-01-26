import 'package:flutter_app/app/controllers/controller.dart';
import 'package:flutter_app/app/models/order.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../networking/orders_api_service.dart';

class OrderController extends Controller {
  Future<List<Order>?> getOrders() async =>
      await api<OrdersApiService>((request) => request.fetchOrders());
}
