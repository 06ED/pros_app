import 'package:flutter/material.dart';

class AppealContent extends StatefulWidget {
  final Function(String newData) onEdit;
  final VoidCallback onDelete;
  final String defaultText;

  AppealContent({
    super.key,
    required this.defaultText,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  State<AppealContent> createState() => _AppealContentPageState();
}

class _AppealContentPageState extends State<AppealContent> {
  bool _active = false;

  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(
      text: widget.defaultText,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(30),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 20,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.multiline,
              minLines: 11,
              maxLines: 18,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 30, 54, 133), width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
              style: TextStyle(
                color: Color.fromARGB(255, 30, 54, 133),
                fontSize: 14,
              ),
              scrollPadding: EdgeInsets.all(20.0),
              autofocus: true,
              readOnly: !_active,
            ),
            TextButton(
              onPressed: () => setState(() {
                if (!_active) {
                  _active = true;
                  return;
                }

                _active = false;
                widget.onEdit.call(_controller.text);
              }),
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
                  _active ? "Сохранить" : "Редактировать",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextButton(
              onPressed: widget.onDelete,
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
                  "Удалить",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
