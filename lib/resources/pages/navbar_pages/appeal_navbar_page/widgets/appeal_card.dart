import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/app/models/appeal.dart';

class AppealCard extends StatelessWidget {
  final Appeal appeal;
  final VoidCallback onDelete;

  const AppealCard({super.key, required this.appeal, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => routeTo("/appeal", data: {
        "appeal": appeal,
        "on_delete": onDelete,
      }),
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
                  " №${appeal.number}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 30, 54, 133),
                  ),
                ),
              ],
            ),
            Text(appeal.body!.length > 30
                ? appeal.body!.substring(0, 30) + "..."
                : appeal.body!),
          ],
        ),
      ),
    );
  }
}
