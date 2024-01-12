import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../../app/models/appeal.dart';

class AppealNavBarPage extends NyStatefulWidget {
  AppealNavBarPage() : super('/appeal', child: _AppealNavBarPageState());
}

class _AppealNavBarPageState extends NyState<AppealNavBarPage> {
  late List<Appeal> appeals;

  @override
  boot() {
    return super.boot();
  }

  @override
  Widget build(BuildContext context) {
    return afterLoad(
      child: () => Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "headers.appeal".tr(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              margin: EdgeInsets.only(bottom: 10),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: appeals.length,
                itemBuilder: (context, index) => Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
