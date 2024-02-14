import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pros_app/resources/widgets/dialogs/input_dialog.dart';

class SuperVipOrderWidget extends StatefulWidget {
  final TextEditingController controller;

  const SuperVipOrderWidget({super.key, required this.controller});

  @override
  State<SuperVipOrderWidget> createState() => _SuperVipOrderWidgetState();
}

class _SuperVipOrderWidgetState extends State<SuperVipOrderWidget> {
  int _selectedPayment = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 20,
      children: [
        ToggleButtons(
          children: [
            _buildText(
                "pages.payment.payment_type.cache".tr(), _selectedPayment == 0),
            _buildText(
                "pages.payment.payment_type.card".tr(), _selectedPayment == 1),
          ],
          isSelected: [_selectedPayment == 0, _selectedPayment == 1],
          fillColor: Color.fromARGB(255, 30, 54, 133),
          borderRadius: BorderRadius.circular(10),
          borderColor: Color.fromARGB(255, 30, 54, 133),
          selectedBorderColor: Color.fromARGB(255, 30, 54, 133),
          onPressed: (index) => setState(() {
            _selectedPayment = index;
          }),
        ),
        TextButton(
          onPressed: () => _generateDialog(),
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
              "pages.payment.eat_place".tr(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
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

  void _generateDialog() => showInputDialog(
        context: context,
        controller: widget.controller,
        labelText: "pages.payment.where_eat".tr(),
        buttonText: "pages.payment.add_eat".tr(),
      );
}
