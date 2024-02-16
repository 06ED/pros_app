import 'package:flutter/material.dart';

import '../../../config/design.dart';

void showInputDialog({
  required BuildContext context,
  required TextEditingController controller,
  required String labelText,
  required String buttonText,
  String? hintText,
  VoidCallback? onPress,
}) =>
    getDialog(
      context: context,
      title: Text(
        labelText,
        style: TextStyle(
          color: Color.fromARGB(255, 30, 54, 133),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              maxLines: 11,
              minLines: 11,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 30, 54, 133), width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
                hintText: hintText,
              ),
              style: TextStyle(
                color: Color.fromARGB(255, 30, 54, 133),
                fontSize: 14,
              ),
              scrollPadding: EdgeInsets.all(20.0),
              autofocus: true,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {
                  if (onPress != null) {
                    onPress.call();
                  }
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromARGB(255, 30, 54, 133),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30,
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
