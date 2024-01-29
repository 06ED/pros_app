import 'package:flutter/widgets.dart';
import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  String? id;
  String? name;
  String? email;
  String? image;
  bool? isVip;

  User({this.id, this.name, this.email, this.image, this.isVip});

  User.fromJson(dynamic data) {
    id = data["id"];
    name = data['name'];
    email = data['email'];
    image = data['image'];
    isVip = data['isVip'];
  }

  NetworkImage get imageWidget => NetworkImage(image!);

  @override
  toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
        "isVip": isVip,
      };
}
