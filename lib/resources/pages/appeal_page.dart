import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/models/appeal.dart';

class AppealPage extends NyStatefulWidget {
  static const path = "/appeal";

  AppealPage() : super(path, child: _AppealPageState());
}

class _AppealPageState extends NyState<AppealPage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final Appeal appeal = widget.data()["appeal"];
    final int number = widget.data()["number"];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "pages.appeals.appeal".tr(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              " №${number}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 30, 54, 133),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ToggleButtons(
            children: [
              _buildText("Обращение", _current == 0),
              _buildText("Ответ", _current == 1),
            ],
            isSelected: [true, false],
            color: Colors.white,
            selectedColor: Color.fromARGB(255, 30, 54, 133),
            borderRadius: BorderRadius.circular(10),
            borderColor: Color.fromARGB(255, 30, 54, 133),
            onPressed: (index) => setState(() {
              _current = index;
            }),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          _buildContent(_current == 0 ? appeal.feedback!.body! : appeal.body!),
        ],
      ),
    );
  }

  Widget _buildText(String text, bool isSelected) => Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Color.fromARGB(255, 30, 54, 133),
        ),
      );

  Widget _buildContent(String data) => Expanded(
        child: SingleChildScrollView(
          child: Text(
            data,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      );
}
