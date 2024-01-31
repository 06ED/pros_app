import 'package:nylo_framework/nylo_framework.dart';

import 'dish.dart';

class Order extends Model {
  String? id;
  int? price;
  String? placeOfDelivery;
  int? countOfPersons;
  String? wishes;
  String? status;
  List<Dish>? dishes;

  Order({this.id, this.price, this.status, this.dishes});

  Order.fromJson(dynamic data) {
    id = data["id"];
    price = data["price"];
    placeOfDelivery = data["placeOfDelivery"];
    countOfPersons = data["countOfPersons"];
    wishes = data["wishes"];
    status = data["status"];
    dishes = (data["dishes"] as List).map((e) => Dish.fromJson(e)).toList();
  }

  @override
  toJson() {
    return {
      "id": id,
      "price": price,
      "placeOfDelivery": placeOfDelivery,
      "countOfPersons": countOfPersons,
      "wishes": wishes,
      "status": status,
      "dishes": dishes?.map((e) => e.toJson()),
    };
  }
}
