import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/l10n.dart';

final errorTextProvider = StateProvider<String?>((_) => null);

class ApiKeyInputDialog extends ConsumerWidget {
  ApiKeyInputDialog({Key? key}) : super(key: key);

  final openAiAPIKeyRegExp = RegExp(r'^sk-[a-zA-Z0-9]{48}$');
  final apiKeyInputController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorText = ref.watch(errorTextProvider);
    final l10n = L10n.of(context)!;

    return AlertDialog(
      title: Text(l10n.dialog_api_key_title),
      content: TextField(
        controller: apiKeyInputController,
        decoration: InputDecoration(
          hintText: l10n.dialog_api_key_textfield,
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
              ref.read(errorTextProvider.notifier).state =
                  l10n.dialog_api_key_textfield_error;
            }
          },
        ),
      ],
    );
  }
}
