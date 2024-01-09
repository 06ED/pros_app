import 'package:flutter_app/config/design.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter/material.dart';
import '../../app/models/dish.dart';
import '/app/controllers/home_controller.dart';

class HomePage extends NyStatefulWidget<HomeController> {
  static const path = '/home';

  HomePage() : super(path, child: _HomePageState());
}

class _HomePageState extends NyState<HomePage> {
  @override
  Widget build(BuildContext context) {

    return afterLoad(
      child: () =>
          Scaffold(
            appBar: appBar,
            body: ,
            bottomNavigationBar: BottomNavigationBar(
              items: [],
            ),
          ),
      loading: const Placeholder(),
    );
  }
}
