import 'package:pros_app/app/models/menu.dart';

import '/app/networking/api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../models/category.dart';

class CategoryApiService extends ApiService {
  CategoryApiService({super.buildContext});

  @override
  String get baseUrl => "${getEnv('API_BASE_URL')}/categories";

  Future<List<Category>?> fetchCategories(Menu menu) async =>
      await network<List<Category>>(
          request: (request) =>
              request.get("/menu/${menu.id}"));
}
