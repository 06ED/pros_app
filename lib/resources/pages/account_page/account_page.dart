import 'package:flutter/material.dart';
import 'package:pros_app/resources/pages/introduction_page/introduction_page.dart';
import '/app/controllers/account_controller.dart';
import '../home_page/home_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../../app/models/user.dart';

class AccountPage extends NyStatefulWidget<AccountController> {
  static const path = '/account';

  AccountPage() : super(path, child: _AccountPageState());
}

class _AccountPageState extends NyState<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final self = Auth.user<User>()!;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.symmetric(
              vertical: 150,
              horizontal: 50,
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 241, 241, 241),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            top: 100,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Color.fromARGB(255, 30, 54, 133),
                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
                Text(
                  self.name!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  self.email!,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Padding(padding: EdgeInsets.all(20)),
                Text(
                  "Имя: ${self.name}",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Фамилия: ${self.surname}",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Роль: ${self.roles!.first}",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Padding(padding: EdgeInsets.all(20)),
                TextButton(
                  onPressed: () async {
                    await widget.controller.logout();
                    routeTo(
                      IntroductionPage.path,
                      navigationType: NavigationType.pushAndForgetAll,
                    );
                  },
                  autofocus: true,
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 30, 54, 133),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 50,
                    ),
                    child: Text(
                      "Выйти",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 30, 54, 133),
        onPressed: () =>
            routeTo(HomePage.path, navigationType: NavigationType.pushReplace),
        mini: true,
        child: Icon(
          Icons.arrow_back_outlined,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
