import 'package:flutter/material.dart';
import '../../../widgets/refresh_indicator_widget.dart';
import 'widgets/appeal_card.dart';
import 'package:pros_app/resources/widgets/dialogs/input_dialog.dart';
import '/app/controllers/appeals_controller.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '/app/models/appeal.dart';

class AppealNavBarPage extends NyStatefulWidget<AppealsController> {
  AppealNavBarPage() : super('/appeals', child: _AppealNavBarPageState());
}

class _AppealNavBarPageState extends NyState<AppealNavBarPage> {
  final TextEditingController _controller = new TextEditingController();
  late List<Appeal> appeals;

  @override
  boot() async => appeals = await widget.controller.getAppeals() ?? [];

  @override
  Widget build(BuildContext context) {
    return afterLoad(
      child: () => PullToRefreshWidget(
        onRefresh: () => reboot(),
        child: Scaffold(
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
                      child: AppealCard(
                        appeal: appeals[index],
                        onDelete: () => reboot(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 30, 54, 133),
            onPressed: () => _generateDialog(() async {
              await widget.controller.createAppeal(_controller.text);
              _controller.clear();
              reboot();
            }),
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _generateDialog(VoidCallback onPress) => showInputDialog(
        context: context,
        controller: _controller,
        labelText: "pages.appeals.create".tr(),
        buttonText: "pages.appeals.send".tr(),
        hintText: "pages.appeals.text".tr(),
        onPress: onPress,
      );
}
