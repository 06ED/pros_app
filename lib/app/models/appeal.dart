import 'package:nylo_framework/nylo_framework.dart';

class Appeal extends Model {
  String? id;
  String? text;

  Appeal({this.id, this.text});

  Appeal.fromJson(dynamic data) {
    id = data["id"];
    text = data["text"];
  }

  @override
  toJson() => {
        "text": text,
        "id": id,
      };
}
