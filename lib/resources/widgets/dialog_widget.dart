import 'dart:ui';

import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  final Widget? child;

  DialogWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 10,
        sigmaY: 10,
      ),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: child,
        ),
      ),
    );
  }
}
