import 'dart:ui';

import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  static const _borderRadius = 10.0;
  static const _blurSigma = 10.0;

  final Widget? child;
  final Widget title;

  DialogWidget({super.key, required this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_borderRadius),
        child: BackdropFilter(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  title,
                  IconButton(
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
          filter: ImageFilter.blur(
            sigmaX: _blurSigma,
            sigmaY: _blurSigma,
          ),
        ),
      ),
    );
  }
}
