import 'l10n.dart';

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get main_chat_input_textfield => 'Chat here.';

  @override
  String get main_chat_clear_memory => 'Clear chat history/memory';

  @override
  String get settings_title => 'Settings';

  @override
  String get settings_change_api_key => 'Change API key';

  @override
  String get drawer_tile_settings => 'Settings';

  @override
  String get dialog_api_key_title => 'API Key';

  @override
  String get dialog_api_key_textfield => 'Enter your Open AI API key';

  @override
  String get dialog_api_key_textfield_error => 'The entered value is not an API key';

  @override
  String get main_chat_send => 'Send chat';

  @override
  String get error_message => 'An error has occurred';

  @override
  String get loading_message => 'Loading...';
}
