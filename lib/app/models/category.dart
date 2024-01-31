import 'package:nylo_framework/nylo_framework.dart';

class Category extends Model {
  String? id;
  String? title;
  String? description;

  Category({this.id, this.title, this.description});

  Category.fromJson(dynamic data) {
    id = data["id"];
    title = data["title"];
    description = data["description"];
  }

  @override
  toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
    };
  }
}