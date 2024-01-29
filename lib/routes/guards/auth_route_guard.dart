import 'package:flutter/material.dart';
import '/resources/pages/auth_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| Auth Route Guard
|
| Checks if the User is authenticated.
| Learn more https://nylo.dev/docs/5.x/router#route-guards
|--------------------------------------------------------------------------
*/

class AuthRouteGuard extends NyRouteGuard {
  AuthRouteGuard();

  @override
  Future<bool> canOpen(BuildContext? context, NyArgument? data) async =>
      await Auth.loggedIn();

  @override
  redirectTo(BuildContext? context, NyArgument? data) async {
    await routeTo(AuthPage.path);
  }
}
