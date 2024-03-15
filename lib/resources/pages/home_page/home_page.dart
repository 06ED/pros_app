import '../navbar_pages/navbar_pages.dart';
import '/config/design.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter/material.dart';
import '/app/models/user.dart';
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
      _getItem("menu", 0),
      _getItem("appeal", 1),
    ];

    if (Auth.user<User>()!.hasVipPerms) {
      navbarItems.addAll([
        _getItem("orders", 2),
        _getItem("cart", 3),
      ]);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: NySwitch(
        widgets: [
          MenuNavBarPage(),
          AppealNavBarPage(),
          OrdersNavBarPage(),
          CartNavBarPage(),
        ],
        indexSelected: _index,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        selectedIconTheme: IconThemeData(
          color: Color.fromARGB(255, 30, 54, 133),
        ),
        selectedLabelStyle: TextStyle(
          color: Color.fromARGB(255, 30, 54, 133),
        ),
        currentIndex: _index,
        onTap: (index) => setState(() => _index = index),
        items: navbarItems,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }

  BottomNavigationBarItem _getItem(String type, int index) =>
      BottomNavigationBarItem(
        icon: _getIcon("navbar/$type.png"),
        label: "navbar.$type".tr(),
      );

  ImageIcon _getIcon(String path) => ImageIcon(AssetImage(getImageAsset(path)));
}
