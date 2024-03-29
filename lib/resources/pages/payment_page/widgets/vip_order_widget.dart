import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class VipOrderWidget extends StatefulWidget {
  final Function(int index) onChange;

  VipOrderWidget({super.key, required this.onChange});

  @override
  State<VipOrderWidget> createState() => _VipOrderWidgetState();
}

class _VipOrderWidgetState extends State<VipOrderWidget> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ToggleButtons(
        children: [
          _buildText("pages.payment.take_type.yourself".tr(), _selected == 0),
          _buildText("pages.payment.take_type.area".tr(), _selected == 1),
        ],
        isSelected: [_selected == 0, _selected == 1],
        fillColor: Color.fromARGB(255, 30, 54, 133),
        borderRadius: BorderRadius.circular(10),
        borderColor: Color.fromARGB(255, 30, 54, 133),
        selectedBorderColor: Color.fromARGB(255, 30, 54, 133),
        onPressed: (index) => setState(() {
          _selected = index;
          widget.onChange(index);
        }),
      ),
    );
  }

  Widget _buildText(String text, bool isSelected) => Container(
        margin: EdgeInsets.all(10),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: isSelected ? Colors.white : Color.fromARGB(255, 30, 54, 133),
          ),
        ),
      );
}
