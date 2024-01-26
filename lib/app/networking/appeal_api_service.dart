import 'package:flutter_app/app/models/appeal.dart';
import 'package:flutter_app/app/networking/api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AppealApiService extends ApiService {
  AppealApiService({super.buildContext});

  @override
  String get baseUrl => "${getEnv('API_BASE_URL')}/appeal";

  Future<List<Appeal>?> fetchMenu() async =>
      await network<List<Appeal>>(request: (request) => request.get(""));
}
