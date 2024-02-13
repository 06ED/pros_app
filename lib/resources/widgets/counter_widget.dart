import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  final int initValue;
  final int min;
  final int max;
  final int size;
  final Function(int counter)? onPressed;

  CounterButton(this.initValue, {
    super.key,
    this.onPressed,
    this.size = 50,
    this.min = -100,
    this.max = 100,
  });

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIcon(
            onPressed: () =>
                setState(() {
                  _counter++;
                  invokeMethod();
                }),
            icon: Icon(
              Icons.add,
              size: widget.size.toDouble(),
            ),
          ),
          Text(
            _counter.toString(),
            style: TextStyle(
              fontSize: widget.size.toDouble(),
              color: Color.fromARGB(255, 30, 54, 133),
            ),
          ),
          _buildIcon(
            onPressed: () =>
                setState(() {
                  if (widget.min >= _counter) {
                    _counter = widget.min;
                    return;
                  }
                  if (widget.max <= _counter) {
                    _counter = widget.max;
                    return;
                  }

                  _counter--;
                  invokeMethod();
                }),
            icon: Icon(
              Icons.remove,
              size: widget.size.toDouble(),
            ),
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
