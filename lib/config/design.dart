import 'package:flutter/material.dart';
import '../resources/pages/pages.dart';
import '../resources/widgets/dialogs/dialog_widget.dart';
import '/resources/widgets/loader_widget.dart';
import '/resources/widgets/logo_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| Design
| Contains widgets used in the Nylo framework.
|
| Learn more: https://nylo.dev/docs/5.x/themes-and-styling#design
|--------------------------------------------------------------------------
*/

const Widget logo = Logo();
// resources/widgets/logo_widget.dart

const Widget loader = Loader();
// resources/widgets/loader_widget.dart

AppBar get appBar => AppBar(
      backgroundColor: const Color.fromARGB(255, 30, 54, 133),
      title: logo,
      actions: [
        Container(
          margin: EdgeInsets.all(10),
          child: InkWell(
            onTap: () => routeTo(AccountPage.path,
                navigationType: NavigationType.pushReplace),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                    Icons.person,
                    color: const Color.fromARGB(255, 30, 54, 133),
                ),
            )
          ),
        ),
      ],
    );

void getDialog({
  required context,
  required Widget title,
  required Widget child,
}) =>
    showDialog(
      context: context,
      builder: (context) => DialogWidget(
        child: child,
        title: title,
      ),
    );
