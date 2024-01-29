import 'package:flutter/material.dart';
import '/app/controllers/auth_controller.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../config/design.dart';

class AuthPage extends NyStatefulWidget<AuthController> {
  static const path = '/auth';

  AuthPage() : super(path, child: _AuthPageState());
}

class _AuthPageState extends NyState<AuthPage> {
  @override
  stateUpdated(data) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            children: [
              logo,
              Padding(padding: EdgeInsets.all(20)),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 30, 54, 133)),
                ),
                onPressed: () async {
                  await widget.controller.login();
                  routeTo("/main", navigationType: NavigationType.pushReplace);
                },
                child: Text("pages.auth.login".tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
