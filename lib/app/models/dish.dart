import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class Dish extends Model {
  String? id;
  String? title;
  String? description;
  double? calories;
  double? proteins;
  double? fats;
  double? carbohydrates;
  int? price;

  Dish({
    this.id,
    this.title,
    this.description,
    this.calories,
    this.proteins,
    this.fats,
    this.carbohydrates,
    this.price,
  });

  Dish.fromJson(dynamic data) {
    id = data["id"];
    title = data["title"];
    description = data["description"];
    calories = data["calories"];
    proteins = data["proteins"];
    fats = data["fats"];
    carbohydrates = data["carbohydrates"];
    price = data["price"];
  }

  Image get image => Image.network(
        "https://i.artfile.ru/3000x2000_811359_%5Bwww.ArtFile.ru%5D.jpg",
        width: double.infinity,
        height: 200,
        fit: BoxFit.fitWidth,
      );

  @override
  toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "calories": calories,
        "proteins": proteins,
        "fats": fats,
        "carbohydrates": carbohydrates,
        "price": price,
      };
}
