import 'l10n.dart';

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get main_chat_input_textfield => 'Chat here.';

  @override
  String get main_chat_clear_memory => 'Clear chat history/memory';

  @override
  String get main_chat_send => 'Send chat';

  @override
  String get error_message => 'An error has occurred';

  @override
  String get loading_message => 'Loading...';
}