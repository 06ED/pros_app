import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/appeal_controller.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../../app/models/appeal.dart';

class AppealNavBarPage extends NyStatefulWidget<AppealController> {
  AppealNavBarPage() : super('/appeal', child: _AppealNavBarPageState());
}

class _AppealNavBarPageState extends NyState<AppealNavBarPage> {
  late List<Appeal> appeals;

  @override
  boot() {
    appeals = [
      Appeal(
          text: "loremas sdaf dsafdsf sdfgdfgsfdsfd sddsf sdafassdaf dsafsda"),
      Appeal(
          text:
              "loremas sdaf dsafdsf aS2 12 sdfgdfgsfdsfd sddsf sdafassdaf dsafsda"),
      Appeal(
          text:
              "loremas sdaf dsafdsf sdfgdfgsfads asfadsdsfd sddsf sdafassdaf dsafadsdsafsda"),
      Appeal(
          text: "loremas sdaf dsafdsf sdfgdfgsfdsfd sddsf sdafassdaf dsafsda"),
      Appeal(
          text:
              "loremas sdaf dsafdsf aS2 12 sdfgdfgsfdsfd sddsf sdafassdaf dsafsda"),
      Appeal(
          text:
              "loremas sdaf dsafdsf sdfgdfgsfads asfadsdsfd sddsf sdafassdaf dsafadsdsafsda"),
      Appeal(
          text: "loremas sdaf dsafdsf sdfgdfgsfdsfd sddsf sdafassdaf dsafsda"),
      Appeal(
          text:
          "loremas sdaf dsafdsf aS2 12 sdfgdfgsfdsfd sddsf sdafassdaf dsafsda"),
      Appeal(
          text:
          "loremas sdaf dsafdsf sdfgdfgsfads asfadsdsfd sddsf sdafassdaf dsafadsdsafsda"),
      Appeal(
          text: "loremas sdaf dsafdsf sdfgdfgsfdsfd sddsf sdafassdaf dsafsda"),
      Appeal(
          text:
          "loremas sdaf dsafdsf aS2 12 sdfgdfgsfdsfd sddsf sdafassdaf dsafsda"),
      Appeal(
          text:
          "loremas sdaf dsafdsf sdfgdfgsfads asfadsdsfd sddsf sdafassdaf dsafadsdsafsda"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return afterLoad(
      child: () => Scaffold(
        body: Container(
          margin: EdgeInsets.only(
            right: 20,
            top: 20,
            left: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "headers.appeals".tr(),
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
                    child: _buildAppeal(appeals[index], index),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 30, 54, 133),
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildAppeal(Appeal item, int index) => InkWell(
        splashColor: Colors.transparent,
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 241, 241, 241),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "pages.appeals.appeal".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    " №${index + 1}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 30, 54, 133),
                    ),
                  ),
                ],
              ),
              Text(item.text!.length > 30
                  ? item.text!.substring(0, 30) + "..."
                  : item.text!),
            ],
          ),
        ),
      );
}
