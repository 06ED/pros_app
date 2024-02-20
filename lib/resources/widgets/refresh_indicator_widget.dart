import 'package:flutter/material.dart';

class PullToRefreshWidget extends StatelessWidget {
  final RefreshCallback onRefresh;
  final Widget child;

  const PullToRefreshWidget({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: child,
      onRefresh: onRefresh,
      backgroundColor: Colors.white,
      color: Color.fromARGB(255, 30, 54, 133),
    );
  }
}
