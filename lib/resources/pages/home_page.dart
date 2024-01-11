import 'package:flutter_app/config/design.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter/material.dart';
import '../../app/models/user.dart';
import '/app/controllers/home_controller.dart';

class HomePage extends NyStatefulWidget<HomeController> {
  static const path = '/home';
  static const items = {
  };

  HomePage() : super(path, child: _HomePageState());
}

class _HomePageState extends NyState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final navbarItems = [
      BottomNavigationBarItem(icon: _getIcon("navbar/menu.png")),
      BottomNavigationBarItem(icon: _getIcon("navbar/appeal.png")),
    ];

    if (Auth.user<User>()!.isVip!) {
      navbarItems.addAll([
        BottomNavigationBarItem(icon: _getIcon("navbar/orders.png")),
        BottomNavigationBarItem(icon: _getIcon("navbar/cart.png"))
      ]);
    }

    return Scaffold(
      appBar: appBar,
      body: Placeholder(),
      bottomNavigationBar: BottomNavigationBar(
        items: navbarItems,
      ),
    );
  }

  ImageIcon _getIcon(String path) => ImageIcon(AssetImage(getImageAsset(path)));
}
