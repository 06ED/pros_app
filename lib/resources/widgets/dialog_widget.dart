import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  static const _borderRadius = 10.0;

  final Widget? child;
  final Widget title;

  DialogWidget({super.key, required this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 500,
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    title,
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.close,
                        color: const Color.fromARGB(255, 30, 54, 133),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: child,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
