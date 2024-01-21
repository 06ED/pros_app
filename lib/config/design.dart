import 'package:flutter/material.dart';
import '/resources/pages/account_page.dart';
import '../app/models/user.dart';
import '/config/toast_notification.dart';
import '/resources/widgets/loader_widget.dart';
import '/resources/widgets/logo_widget.dart';
import '/resources/widgets/toast_notification_widget.dart';
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

AppBar appBar = AppBar(
  backgroundColor: const Color.fromARGB(255, 30, 54, 133),
  title: logo,
  actions: [
    Container(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () => routeTo(AccountPage.path, navigationType: NavigationType.pushReplace),
        child: CircleAvatar(
          backgroundImage: Auth.user<User>()!.imageWidget,
          backgroundColor: const Color.fromARGB(255, 30, 54, 133),
        ),
      ),
    ),
  ],
);

Widget getToastNotificationWidget(
    {required ToastNotificationStyleType style,
    Function(ToastNotificationStyleMetaHelper helper)?
        toastNotificationStyleMeta,
    Function? onDismiss}) {
  if (toastNotificationStyleMeta == null) return SizedBox.shrink();

  ToastMeta toastMeta =
      toastNotificationStyleMeta(NyToastNotificationStyleMetaHelper(style));

  return ToastNotification(toastMeta, onDismiss: onDismiss);
  // resources/widgets/toast_notification.dart
}
