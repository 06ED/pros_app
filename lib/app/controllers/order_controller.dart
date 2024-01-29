import '../controllers/controller.dart';
import '/app/models/order.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../networking/orders_api_service.dart';

class OrderController extends Controller {
  Future<List<Order>?> getOrders() async =>
      await api<OrdersApiService>((request) => request.fetchOrders());
}
