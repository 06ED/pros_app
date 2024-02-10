import 'package:nylo_framework/nylo_framework.dart';

class Feedback extends Model {
  String? id;
  String? body;

  Feedback({
    this.id,
    this.body,
  });

  Feedback.fromJson(dynamic data) {
    id = data["id"];
    body = data["body"];
  }

  @override
  toJson() => {
        "id": id,
        "body": body,
      };
}
