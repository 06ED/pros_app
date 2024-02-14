import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pros_app/app/models/user.dart';
import 'package:pros_app/config/storage_keys.dart';

import '../../bootstrap/helpers.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AuthController extends NyController {
  Future<void> login() async {
    // Parsing token
    final tokenRequest = await client.getTokenWithAuthCodeFlow(
        clientId: getEnv("AUTH_CLIENT_ID"));

    // Saving token
    await NyStorage.store(
        StorageKey.userToken, tokenRequest.accessToken ?? StorageKey.userToken);
    await NyStorage.store(StorageKey.refreshToken,
        tokenRequest.refreshToken ?? StorageKey.refreshToken);

    // Setup user
    final Map decodedToken = JwtDecoder.decode(tokenRequest.accessToken!);

    final user = User(
      id: decodedToken["sid"],
      email: decodedToken["email"],
      name: decodedToken["given_name"],
      surname: decodedToken["family_name"],
      roles: decodedToken["resource_access"][getEnv("AUTH_CLIENT_ID")]["roles"],
    );

    // Logging in
    await Auth.login(user);
  }
}
