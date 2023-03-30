import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final errorTextProvider = StateProvider<String?>((_) => null);

class ApiKeyInputDialog extends ConsumerWidget {
  ApiKeyInputDialog({Key? key}) : super(key: key);

  final openAiAPIKeyRegExp = RegExp(r'^sk-[a-zA-Z0-9]{48}$');
  final apiKeyInputController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorText = ref.watch(errorTextProvider);

    return AlertDialog(
      title: const Text('API Key'),
      content: TextField(
        controller: apiKeyInputController,
        decoration: InputDecoration(
          hintText: 'Enter your Open AI API key',
          errorText: errorText,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            final text = apiKeyInputController.text;
            // Open AIのAPIキーかどうかの正規表現
            if (openAiAPIKeyRegExp.hasMatch(text)) {
              Navigator.of(context).pop(apiKeyInputController.text);
            } else {
              ref.read(errorTextProvider.notifier).state = 'Invalid API Key';
            }
          },
        ),
      ],
    );
  }
}
