import 'package:nylo_framework/nylo_framework.dart';

import 'dish.dart';

class Order extends Model {
  String? id;
  int? price;
  String? placeOfDelivery;
  int? countOfPersons;
  int? number;
  String? wishes;
  String? status;
  List<Dish>? dishes;
  String? paymentMethod;
  DateTime? submissionTime;

  Order({
    this.id,
    this.price,
    this.status,
    this.dishes,
    this.number,
    this.placeOfDelivery,
    this.countOfPersons,
    this.wishes,
    this.paymentMethod,
    this.submissionTime,
  });

  Order.fromJson(dynamic data) {
    id = data["id"];
    price = data["price"];
    placeOfDelivery = data["placeOfDelivery"];
    countOfPersons = data["countOfPersons"];
    wishes = data["wishes"];
    status = data["status"];
    dishes = (data["dishes"] as List).map((e) => Dish.fromJson(e)).toList();
    submissionTime = DateTime.tryParse(data["submissionTime"]);
    paymentMethod = data["paymentMethod"];
    number = data["number"];
  }

  @override
  toJson() => {
        "price": price,
        "placeOfDelivery": placeOfDelivery,
        "countOfPersons": countOfPersons,
        "wishes": wishes,
        "status": "Готовим",
        "dishIds": dishes?.map((e) => e.id).toList(),
        "submissionTime": "${submissionTime!.toIso8601String()}+00:00",
        "paymentMethod": paymentMethod,
      };
}
