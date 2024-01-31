import 'package:flutter/material.dart';
import '/app/controllers/account_controller.dart';
import '/resources/pages/home_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../app/models/user.dart';

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
