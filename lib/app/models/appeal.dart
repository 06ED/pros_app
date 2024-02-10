import 'package:nylo_framework/nylo_framework.dart';

import 'feedback.dart';

class Appeal extends Model {
  String? id;
  String? body;
  Feedback? feedback;

  Appeal({
    this.id,
    this.body,
    this.feedback,
  });

  Appeal.fromJson(dynamic data) {
    id = data["id"];
    body = data["body"];
    feedback = Feedback.fromJson(data["feedback"]);
  }

  @override
  toJson() => {
        "feedback": feedback!.toJson(),
        "body": body,
        "id": id,
      };
}
