import 'package:bottom_blur_bar/bottom_blur_bar.dart';
import 'package:flutter_app/config/design.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter/material.dart';
import '../../app/models/user.dart';
import '/app/controllers/home_controller.dart';
import 'navbar/appeal_navbar_page.dart';
import 'navbar/menu_navbar_page.dart';
import 'navbar/orders_navbar_page.dart';

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
      BlurNavbarItem(
        icon: _getIcon("navbar/menu.png"),
        title: "navbar.menu".tr(),
      ),
      BlurNavbarItem(
        icon: _getIcon("navbar/appeal.png"),
        title: "navbar.appeal".tr(),
      ),
    ];

    if (Auth.user<User>()!.isVip!) {
      navbarItems.addAll([
        BlurNavbarItem(
          icon: _getIcon("navbar/orders.png"),
          title: "navbar.orders".tr(),
        ),
        BlurNavbarItem(
          icon: _getIcon("navbar/cart.png"),
          title: "navbar.cart".tr(),
        )
      ]);
    }

    return Scaffold(
      appBar: appBar,
      body: _getByIndex(_index),
      bottomNavigationBar: BlurNavbar(
        onTap: (index) => setState(() => _index = index),
        items: navbarItems,
      ),
    );
  }

  ImageIcon _getIcon(String path) => ImageIcon(AssetImage(getImageAsset(path)));

  StatefulWidget _getByIndex(int index) => switch (index) {
        0 => MenuNavBarPage(),
        1 => AppealNavBarPage(),
        2 => OrdersNavBarPage(),
        _ => MenuNavBarPage(),
      };
}
