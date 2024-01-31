import '../../app/models/appeal.dart';
import '../../app/networking/api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AppealApiService extends ApiService {
  AppealApiService({super.buildContext});

  @override
  String get baseUrl => "${getEnv('API_BASE_URL')}/appeals";

  Future<List<Appeal>?> fetchAppeals() async =>
      await network<List<Appeal>>(request: (request) => request.get("/user"));

  Future<Null> createAppeal(String body) async => await network(
        request: (request) => request.post(
          "",
          data: {"body": body},
        ),
      );
}