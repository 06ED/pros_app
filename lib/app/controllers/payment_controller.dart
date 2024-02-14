import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/networking/payment_api_service.dart';

import '../models/order.dart';

class PaymentController extends NyController {
  Future<void> createOrder(Order order) async =>
      await api<PaymentApiService>((request) => request.createOrder(order));
}
