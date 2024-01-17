import 'package:nylo_framework/nylo_framework.dart';

import 'dish.dart';

class Order extends Model {
  int? cost;
  DateTime? time;
  bool? status;
  List<Dish>? dishes;

  Order.fromJson(dynamic data) {
    cost = data["cost"];
    time = DateTime.tryParse(data["time"]);
    status = data["status"];
    dishes = (data["dishes"] as List).map((e) => Dish.fromJson(e)).toList();
  }

  @override
  toJson() {
    return {
      "cost": cost,
      "time": time.toString(),
      "status": status,
      "dishes": dishes?.map((e) => e.toJson()),
    };
  }
}
