import 'package:flutter/widgets.dart';
import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  String? name;
  String? email;
  String? image;
  bool? isVip;

  User();

  User.fromJson(dynamic data) {
    name = data['name'];
    email = data['email'];
    image = data['image'];
    isVip = data['isVip'];
  }

  ImageProvider get imageWidget => NetworkImage(image!);

  @override
  toJson() => {"name": name, "email": email, "image": image, "isVip": isVip};
}
