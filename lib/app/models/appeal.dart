import 'package:nylo_framework/nylo_framework.dart';

class Appeal extends Model {
  String? id;
  String? body;

  Appeal({this.id, this.body});

  Appeal.fromJson(dynamic data) {
    id = data["id"];
    body = data["body"];
  }

  @override
  toJson() => {
        "body": body,
        "id": id,
      };
}
