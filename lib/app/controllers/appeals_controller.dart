import '/app/models/appeal.dart';
import '/app/networking/appeal_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AppealsController extends NyController {
  Future<List<Appeal>?> getAppeals() async =>
      await api<AppealApiService>((request) => request.fetchAppeals());

  Future<void> createAppeal(String body) async {
    return await api<AppealApiService>((request) => request.createAppeal(body));
  }
}
