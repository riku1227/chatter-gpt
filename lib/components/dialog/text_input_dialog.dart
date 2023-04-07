import 'package:flutter/material.dart';

class TextInputDialog extends StatelessWidget {
  final String title;
  final String positiveButtonText;
  final String negativeButtonText;
  final String? textFieldHint;

  final textController = TextEditingController();

  TextInputDialog({
    Key? key,
    required this.title,
    required this.positiveButtonText,
    required this.negativeButtonText,
    this.textFieldHint,
    String? defaultValue,
  }) : super(key: key) {
    textController.text = defaultValue ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: textFieldHint,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            final text = textController.text;
            Navigator.of(context).pop(text);
          },
        ),
      ],
    );
  }
}
