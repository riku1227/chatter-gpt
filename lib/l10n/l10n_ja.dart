import 'l10n.dart';

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get main_chat_input_textfield => 'チャットをここに入力';

  @override
  String get main_chat_clear_memory => 'チャット履歴/記憶を削除する';

  @override
  String get dialog_api_key_title => 'APIキー';

  @override
  String get dialog_api_key_textfield => 'Open AIのAPIキーを入力してください';

  @override
  String get dialog_api_key_textfield_error => '入力された値はAPIキーではありません';

  @override
  String get main_chat_send => 'チャットを送信する';

  @override
  String get error_message => 'エラーが発生しました';

  @override
  String get loading_message => '読み込み中...';
}
