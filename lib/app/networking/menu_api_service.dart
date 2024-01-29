import '../../app/models/dish.dart';
import '../../app/networking/api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class MenuApiService extends ApiService {
  MenuApiService({super.buildContext});

  @override
  String get baseUrl => "${getEnv('API_BASE_URL')}/menu";

  Future<List<Dish>?> fetchMenu() async =>
      await network<List<Dish>>(request: (request) => request.get(""));
}
