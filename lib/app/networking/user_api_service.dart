import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/networking/api_service.dart';
import 'package:pros_app/config/storage_keys.dart';

class UserApiService extends ApiService {
  @override
  String get baseUrl => "";

  Future<Null> logout() async => await network(
        request: (request) async => request.post(
          getEnv("LOGOUT_URL"),
          data: {
            "client_id": getEnv("AUTH_CLIENT_ID"),
            "refresh_token": await NyStorage.read(StorageKey.refreshToken),
          },
        ),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
      );
}
