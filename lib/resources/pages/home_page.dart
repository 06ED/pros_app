import 'package:flutter_app/config/design.dart';
import 'package:flutter_app/resources/widgets/navbar/appeal_navbar_page.dart';
import 'package:flutter_app/resources/widgets/navbar/menu_navbar_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter/material.dart';
import '../../app/models/user.dart';
import '/app/controllers/home_controller.dart';

class HomePage extends NyStatefulWidget<HomeController> {
  static const path = '/home';

  HomePage() : super(path, child: _HomePageState(0));
}

class _HomePageState extends NyState<HomePage> {
  int _index;

  _HomePageState(this._index);

  @override
  Widget build(BuildContext context) {
    final navbarItems = [
      BottomNavigationBarItem(
        icon: _getIcon("navbar/menu.png"),
        label: "navbar.menu".tr(),
      ),
      BottomNavigationBarItem(
        icon: _getIcon("navbar/appeal.png"),
        label: "navbar.appeal".tr(),
      ),
    ];

    if (Auth.user<User>()!.isVip!) {
      navbarItems.addAll([
        BottomNavigationBarItem(
          icon: _getIcon("navbar/orders.png"),
          label: "navbar.orders".tr(),
        ),
        BottomNavigationBarItem(
          icon: _getIcon("navbar/cart.png"),
          label: "navbar.cart".tr(),
        )
      ]);
    }

    return Scaffold(
      appBar: appBar,
      body: _getByIndex(_index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) => setState(() => _index = index),
        items: navbarItems,
      ),
    );
  }

  ImageIcon _getIcon(String path) => ImageIcon(AssetImage(getImageAsset(path)));

  NyStatefulWidget _getByIndex(int index) => switch (index) {
        0 => MenuNavBarPage(),
        1 => AppealNavBarPage(),
        _ => MenuNavBarPage(),
      };
}
