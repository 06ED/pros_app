import 'package:nylo_framework/nylo_framework.dart';

class Appeal extends Model {
  String? text;

  Appeal.fromJson(dynamic data) {
    text = data["text"];
  }

  @override
  toJson() => {"text": text};
}
