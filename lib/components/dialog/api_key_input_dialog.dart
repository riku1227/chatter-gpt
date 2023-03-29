import 'package:flutter/material.dart';

class ApiKeyInputDialog extends StatelessWidget {
  ApiKeyInputDialog({Key? key}) : super(key: key);

  final apiKeyInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('API Key'),
      content: TextField(
        controller: apiKeyInputController,
        decoration:
            const InputDecoration(hintText: 'Enter your Open AI API key'),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop(apiKeyInputController.text);
          },
        ),
      ],
    );
  }
}
