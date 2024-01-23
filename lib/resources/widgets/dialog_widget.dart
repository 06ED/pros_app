import 'dart:ui';

import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  final Widget? child;

  DialogWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRect(
        child: BackdropFilter(
          child: SingleChildScrollView(
            child: child,
          ),
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
        ),
      ),
    );
  }
}
