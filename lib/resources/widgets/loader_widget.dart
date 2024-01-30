import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
        return Center(child: CircularProgressIndicator(
          color: const Color.fromARGB(255, 30, 54, 133),
        ));
      case TargetPlatform.iOS:
        return Center(child: CupertinoActivityIndicator());
      default:
        return Center(child: CircularProgressIndicator());
    }
  }
}
