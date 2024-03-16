import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/networking/user_api_service.dart';
import 'package:pros_app/config/storage_keys.dart';

class AccountController extends NyController {
  Future<void> logout() async {
    await api<UserApiService>((request) => request.logout());

    await NyStorage.clear(StorageKey.refreshToken);
    await NyStorage.clear(StorageKey.userToken);
    await Auth.logout();
  }
}
