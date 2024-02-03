import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/networking/api_service.dart';

import '../models/menu.dart';

class MenuApiService extends ApiService {
  MenuApiService({super.buildContext});

  @override
  String get baseUrl => "${getEnv("API_BASE_URL")}/menu";

  Future<Menu?> fetchMenu() async =>
      await network<Menu>(
          request: (request) =>
              request.get("/today"));
}