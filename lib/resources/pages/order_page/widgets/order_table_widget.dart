import 'package:flutter/material.dart';

class OrderTableWidget extends StatelessWidget {
  final List<TableRow> rows;

  OrderTableWidget({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Color.fromARGB(255, 30, 54, 133),
        borderRadius: BorderRadius.circular(10),
      ),
      children: [
        TableRow(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 30, 54, 133),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            children: [
              _buildHeaderTableText("Блюдо"),
              _buildHeaderTableText("Кол-во"),
              _buildHeaderTableText("Цена"),
            ]),
        ...rows
      ],
    );
  }

  Widget _buildHeaderTableText(String text) => Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      );
}
