import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/models/appeal.dart';
import 'package:pros_app/app/networking/appeal_api_service.dart';

class AppealController extends NyController {
  Future<void> updateAppeal(Appeal appeal) async =>
      await api<AppealApiService>((request) => request.updateAppeal(appeal));

  Future<void> deleteAppeal(Appeal appeal) async =>
      await api<AppealApiService>((request) => request.deleteAppeal(appeal));

  Future<Appeal> getAppeal(String id) async =>
      await api<AppealApiService>((request) => request.fetchAppeal(id));
}
