import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/networking/api_service.dart';

import '../models/order.dart';

class PaymentApiService extends ApiService {
  PaymentApiService({super.buildContext});

  @override
  String get baseUrl => "${getEnv("API_BASE_URL")}/orders";

  Future<Null> createOrder(Order order) async => await network(
        request: (request) => request.post(
          "",
          data: order.toJson(),
        ),
      );
}
