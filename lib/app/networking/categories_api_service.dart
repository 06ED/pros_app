import '/app/networking/api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../models/category.dart';

class CategoryApiService extends ApiService {
  CategoryApiService({super.buildContext});

  @override
  String get baseUrl => "${getEnv('API_BASE_URL')}/categories";

  Future<List<Category>?> fetchCategories() async =>
      await network<List<Category>>(
          request: (request) =>
              request.get("/menu/c17a30b8-5dc8-4464-b8c9-c9c31901a9f3"));
}
