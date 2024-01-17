import 'dart:ui';

import 'package:flutter_app/config/design.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter/material.dart';
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
      BottomNavigationBarItem(
        icon: _getIcon("navbar/menu.png"),
        label: "navbar.menu".tr(),
      ),
      BottomNavigationBarItem(
        icon: _getIcon("navbar/appeal.png"),
        label: "navbar.appeal".tr(),
      ),
    ];

    // if (Auth.user<User>()!.isVip!) {
    //   navbarItems.addAll([
    //     BlurNavbarItem(
    //       icon: _getIcon("navbar/orders.png"),
    //       title: "navbar.orders".tr(),
    //     ),
    //     BlurNavbarItem(
    //       icon: _getIcon("navbar/cart.png"),
    //       title: "navbar.cart".tr(),
    //     )
    //   ]);
    // }

    return Scaffold(
      appBar: appBar,
      body: _getByIndex(_index),
      bottomNavigationBar: _buildBottomNavigation(navbarItems),
    );
  }

  Widget _buildBottomNavigation(List<BottomNavigationBarItem> items) => Align(
    alignment: FractionalOffset.bottomCenter,
    //this is very important, without it the whole screen will be blurred
    child: ClipRect(
      //I'm using BackdropFilter for the blurring effect
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Opacity(
          //you can change the opacity to whatever suits you best
          opacity: 0.8,
          child: BottomNavigationBar(
            currentIndex: _index,
            onTap: (index) => setState(() => _index = index),
            items: items,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    ),
  );

  ImageIcon _getIcon(String path) => ImageIcon(AssetImage(getImageAsset(path)));

  StatefulWidget _getByIndex(int index) => switch (index) {
        0 => MenuNavBarPage(),
        1 => AppealNavBarPage(),
        2 => OrdersNavBarPage(),
        _ => MenuNavBarPage(),
      };
}
