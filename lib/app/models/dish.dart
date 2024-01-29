import 'package:nylo_framework/nylo_framework.dart';

class Dish extends Model {
  String? id;
  String? name;
  double? cost;

  Dish({this.name, this.cost, this.id});

  Dish.fromJson(dynamic data) {
    id = data["id"];
    name = data["name"];
    cost = data["cost"];
  }

  @override
  toJson() => {"id": id, "name": name, "cost": cost};
}
