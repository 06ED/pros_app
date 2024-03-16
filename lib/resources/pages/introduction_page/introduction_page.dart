import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/resources/pages/auth_page/auth_page.dart';

class IntroductionPage extends NyStatefulWidget {
  static const path = "/introduction";

  IntroductionPage() : super(path, child: _IntroductionPageState());
}

class _IntroductionPageState extends NyState<IntroductionPage> {
  @override
  init() async {
    if (await Auth.loggedIn()) {
      routeTo(
        AuthPage.path,
        navigationType: NavigationType.pushReplace,
      );
    }
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "logo.png",
            width: double.infinity,
          ).localAsset(),
          Text(
            "Добро пожаловать",
            style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 30, 54, 133),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () => routeTo(
              AuthPage.path,
              navigationType: NavigationType.pushReplace,
            ),
            style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 30, 54, 133),
              padding: EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),

            child: Text(
              "Войти",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
