import 'dart:developer';

import '../controllers/controller.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AuthController extends Controller {
  Future<void> login() async {
    final result = await FlutterWebAuth2.authenticate(
      url: getEnv("AUTH_URL"),
      callbackUrlScheme: getEnv("AUTH_CALLBACK_SCHEME"),
    );
    log(result);
  }
}
