import 'package:nylo_framework/nylo_framework.dart';

class Dish extends Model {
  String? name;
  double? cost;

  Dish({this.name, this.cost});

  Dish.fromJson(dynamic data) {
    name = data["name"];
    cost = data["cost"];
  }

  @override
  toJson() => {"name": name, "cost": cost};
}
