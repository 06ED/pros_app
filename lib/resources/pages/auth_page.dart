import 'package:flutter/material.dart';
import '/app/controllers/auth_controller.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AuthPage extends NyStatefulWidget<AuthController> {
  static const path = '/auth';

  AuthPage() : super(path, child: _AuthPageState());
}

class _AuthPageState extends NyState<AuthPage> {
  @override
  boot() async => await widget.controller.login();

  @override
  Widget build(BuildContext context) {
    return afterLoad(child: () => routeTo("/home"));
  }
}
