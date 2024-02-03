import 'package:nylo_framework/nylo_framework.dart';

class Menu extends Model {
  String? id;
  String? title;
  String? description;
  bool? today;

  Menu.fromJson(dynamic data) {
    id = data["id"];
    title = data["title"];
    description = data["description"];
    today = data["today"];
  }

  @override
  toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "today": today,
      };
}
