import 'l10n.dart';

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get main_chat_input_textfield => 'チャットをここに入力';

  @override
  String get main_chat_clear_memory => 'チャット履歴/記憶を削除する';

  @override
  String get settings_title => '設定';

  @override
  String get settings_change_api_key => 'APIキーを変更する';

  @override
  String get drawer_tile_settings => '設定';

  @override
  String get drawer_tile_add_chat_session => 'セッションを追加';

  @override
  String get dialog_api_key_title => 'APIキー';

  @override
  String get dialog_api_key_textfield => 'Open AIのAPIキーを入力してください';

  @override
  String get dialog_api_key_textfield_error => '入力された値はAPIキーではありません';

  @override
  String get dialog_delete_chat_session_title => 'セッションを削除';

  @override
  String dialog_delete_chat_session_message(Object session) {
    return '$session を削除しますか？';
  }

  @override
  String get dialog_delete_chat_session_ok => '削除する';

  @override
  String get dialog_change_session_name_title => 'セッション名の変更';

  @override
  String get dialog_change_session_name_textfield => 'セッション名';

  @override
  String get dialog_change_session_name_ok => '変更する';

  @override
  String get main_chat_send => 'チャットを送信する';

  @override
  String get error_message => 'エラーが発生しました';

  @override
  String get loading_message => '読み込み中...';

  @override
  String get message_cancel => 'キャンセル';
}
