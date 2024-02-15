import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/resources/pages/home_page/home_page.dart';

class SuccessOrderPage extends NyStatefulWidget {
  static const path = "/successOrder";

  SuccessOrderPage() : super(path, child: _SuccessOrderPageState());
}

class _SuccessOrderPageState extends NyState<SuccessOrderPage> {
  @override
  Widget build(BuildContext context) {
    return NyFutureBuilder(
      future: _doTime(),
      child: (context, data) => _successWidget,
      loading: _successWidget,
    );
  }

  Future<void> _doTime() async {
    await sleep(3);
    routeTo(HomePage.path, navigationType: NavigationType.pushReplace);
  }

  Widget get _successWidget => Column(
        children: [
          Text(
            "Заказ успешно создан",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 30, 54, 133),
            ),
          ),
          Padding(padding: EdgeInsets.all(20)),
          Icon(
            Icons.check,
            color: Color.fromARGB(255, 30, 54, 133),
            size: 40,
          ),
        ],
      );
}
