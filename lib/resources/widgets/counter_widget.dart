import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  final int initValue;
  final Function(int counter)? onPressed;

  CounterButton(this.initValue, {super.key, this.onPressed});

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int _counter = 0;

  _CounterButtonState() {
    _counter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _buildIcon(
            onPressed: () => setState(() {
              _counter++;
              invokeMethod();
            }),
            icon: Icon(Icons.add),
          ),
          Text(_counter.toString()),
          _buildIcon(
            onPressed: () => setState(() {
              _counter--;
              invokeMethod();
            }),
            icon: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  void invokeMethod() {
    if (widget.onPressed == null) {
      return;
    }

    widget.onPressed!(_counter);
  }

  Widget _buildIcon({
    required VoidCallback onPressed,
    required Icon icon,
  }) =>
      IconButton(
        color: Color.fromARGB(255, 30, 54, 133),
        onPressed: onPressed,
        icon: icon,
      );
}
