import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/models/category.dart';
import 'package:pros_app/app/networking/api_service.dart';

import '../models/dish.dart';

class DishesApiService extends ApiService {
  @override
  String get baseUrl => "${getEnv('API_BASE_URL')}/dishes";

  Future<List<Dish>?> fetchDishesByCategory(Category category) async =>
      await network(
        request: (request) => request.get("/category/${category.id}"),
      );
}
