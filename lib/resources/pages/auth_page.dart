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
    return afterLoad(
      child: () => NyFutureBuilder(
        future: _loginRoute(),
        child: (context, data) => _buildSuccess(),
        loading: _buildSuccess(),
      ),
    );
  }

  Widget _buildSuccess() => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check,
                color: Color.fromARGB(255, 30, 54, 133),
                size: 40,
              ),
              Text(
                "pages.auth.success".tr(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 30, 54, 133),
                ),
              ),
            ],
          ),
        ),
      );

  Future<void> _loginRoute() async {
    await sleep(3);
    routeTo("/home", navigationType: NavigationType.pushReplace);
  }
}
