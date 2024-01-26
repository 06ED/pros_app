import 'package:flutter_app/app/models/order.dart';
import 'package:flutter_app/app/networking/api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class OrdersApiService extends ApiService {
  OrdersApiService({super.buildContext});

  @override
  String get baseUrl => "${getEnv('API_BASE_URL')}/orders";

  Future<List<Order>?> fetchOrders() async =>
      await network<List<Order>>(request: (request) => request.get(""));
}
