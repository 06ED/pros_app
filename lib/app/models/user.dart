import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  String? id;
  String? name;
  String? surname;
  String? email;
  List<dynamic>? roles;

  User({
    this.id,
    this.name,
    this.surname,
    this.email,
    this.roles,
  });

  User.fromJson(dynamic data) {
    id = data["id"];
    name = data['name'];
    surname = data['surname'];
    email = data['email'];
    roles = data['roles'];
  }

  bool get isVip => (roles ?? []).contains("vip");

  bool get isSuperVip => (roles ?? []).contains("super_vip");

  bool get canCreateOrders => isVip || isSuperVip;

  @override
  toJson() => {
        "id": id,
        "name": name,
        "surname": surname,
        "email": email,
        "roles": roles,
      };
}
