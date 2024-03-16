import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pros_app/bootstrap/helpers.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:pros_app/resources/pages/auth_page/auth_page.dart';
import '../../config/storage_keys.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| ApiService
| -------------------------------------------------------------------------
| Define your API endpoints

| Learn more https://nylo.dev/docs/5.x/networking
|--------------------------------------------------------------------------
*/

class ApiService extends NyApiService {
  ApiService({BuildContext? buildContext})
      : super(buildContext, decoders: modelDecoders);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  @override
  final interceptors = {
    if (getEnv('APP_DEBUG') == true) PrettyDioLogger: PrettyDioLogger(),
  };

  @override
  Future<RequestHeaders> setAuthHeaders(RequestHeaders headers) async =>
      headers.addBearerToken(await NyStorage.read(StorageKey.userToken));

  @override
  Future<bool> shouldRefreshToken() async =>
      JwtDecoder.isExpired(await NyStorage.read(StorageKey.userToken));

  @override
  refreshToken(Dio dio) async {
    final token = await client.refreshToken(
      await NyStorage.read(StorageKey.refreshToken),
      clientId: getEnv("AUTH_CLIENT_ID"),
    );

    if (token.httpStatusCode == 401) {
      log("message");
      await Auth.logout();
      routeTo(AuthPage.path);
    }

    await NyStorage.store(StorageKey.userToken, token.accessToken);
  }
}
