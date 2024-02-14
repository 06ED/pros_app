import 'package:nylo_framework/nylo_framework.dart';

import 'feedback.dart';

class Appeal extends Model {
  String? id;
  String? body;
  int? number;
  Feedback? feedback;

  Appeal({
    this.id,
    this.body,
    this.feedback,
  });

  Appeal.fromJson(dynamic data) {
    id = data["id"];
    body = data["body"];
    number = data["number"];
    feedback = data["feedback"] != null
        ? Feedback.fromJson(data["feedback"])
        : Feedback.empty();
  }

  @override
  toJson() => {
        "feedback": feedback != null ? feedback!.toJson() : null,
        "body": body,
        "id": id,
        "number": number,
      };
}
