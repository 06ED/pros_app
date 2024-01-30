import 'dart:developer';

import 'package:pros_app/config/storage_keys.dart';

import '../../bootstrap/helpers.dart';
import '../controllers/controller.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AuthController extends Controller {
  Future<void> login() async {
    // Parsing and saving token
    final tokenRequest = await client.getTokenWithAuthCodeFlow(
        clientId: getEnv("AUTH_CLIENT_ID"));
    await NyStorage.store(StorageKey.userToken, tokenRequest.accessToken ?? "");
    await NyStorage.store(
        StorageKey.refreshToken, tokenRequest.refreshToken ?? "");
    log(tokenRequest.accessToken!);
  }
}
