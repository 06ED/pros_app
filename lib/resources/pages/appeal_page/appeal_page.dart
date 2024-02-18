import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/controllers/appeal_controller.dart';
import 'package:pros_app/app/models/appeal.dart';
import 'package:pros_app/resources/pages/appeal_page/widgets/appeal_content_widget.dart';
import 'package:pros_app/resources/widgets/loader_widget.dart';

class AppealPage extends NyStatefulWidget<AppealController> {
  static const path = "/appeal";

  AppealPage() : super(path, child: _AppealPageState());
}

class _AppealPageState extends NyState<AppealPage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    Appeal appeal = widget.data()["appeal"];
    VoidCallback onDelete = widget.data()["on_delete"];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "pages.appeals.appeal".tr() + " №${appeal.number}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 30, 54, 133),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Center(
            child: ToggleButtons(
              children: [
                _buildText("Обращение", _current == 0),
                _buildText("Ответ", _current == 1),
              ],
              isSelected: [_current == 0, _current == 1],
              fillColor: Color.fromARGB(255, 30, 54, 133),
              borderRadius: BorderRadius.circular(10),
              borderColor: Color.fromARGB(255, 30, 54, 133),
              selectedBorderColor: Color.fromARGB(255, 30, 54, 133),
              onPressed: (index) => setState(() {
                _current = index;
              }),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          _current == 0
              ? AppealContent(
                  defaultText: appeal.body!,
                  onEdit: (newText) async {},
                  onDelete: () async {
                    await widget.controller.deleteAppeal(appeal);
                    Navigator.pop(context);
                    onDelete.call();
                  },
                )
              : appeal.feedback!.empty
                  ? Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 150,
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Loader(),
                            Padding(padding: EdgeInsets.all(10)),
                            Text(
                              "На рассмотрении",
                              style: TextStyle(
                                fontSize: 24,
                                color: Color.fromARGB(255, 30, 54, 133),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                            TextButton(
                              onPressed: () async => appeal =
                                  await widget.controller.getAppeal(appeal.id!),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                  Color.fromARGB(255, 30, 54, 133),
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 30,
                                ),
                                child: Text(
                                  "Обновить",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : _buildContent(appeal.feedback!.body!)
        ],
      ),
    );
  }

  Widget _buildText(String text, bool isSelected) => Container(
        margin: EdgeInsets.all(10),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: isSelected ? Colors.white : Color.fromARGB(255, 30, 54, 133),
          ),
        ),
      );

  Widget _buildContent(String data) => Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromARGB(255, 241, 241, 241),
          ),
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Text(
              data,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 30, 54, 133),
              ),
            ),
          ),
        ),
      );
}
