import 'dart:convert';
import 'dart:io';

import 'package:chatter_gpt/model/chat_memory_model.dart';
import 'package:path_provider/path_provider.dart';

/// ChatSession関連のjsonファイルを良い感じに扱うリポジトリクラス
class ChatSessionRepository {
  /// セッションのID一覧が書かれているjsonファイルのファイル名
  static const sessionListFileName = "chat_session_list.json";

  /// 各セッションを保存するディレクトリの名前
  static const sessionDirectoryName = "session";

  /// セッションのID一覧が書かれているjsonファイルを読み込む
  /// もしファイルが存在しなかった場合は空の配列を返す
  static Future<List<String>> readSessionIdList() async {
    final baseDir = await getApplicationSupportDirectory();
    final sessionListFile = File('${baseDir.path}/$sessionListFileName');

    if (await sessionListFile.exists()) {
      final contents = await sessionListFile.readAsString();
      return List<String>.from(json.decode(contents));
    } else {
      return [];
    }
  }

  /// セッションのID一覧が書かれているjsonファイルを書き込む
  static Future<void> writeSessionIdList(List<String> sessionIdList) async {
    final baseDir = await getApplicationSupportDirectory();
    final sessionListFile = File('${baseDir.path}/$sessionListFileName');

    await sessionListFile.writeAsString(json.encode(sessionIdList));
  }

  /// セッションのIDでセッションを読み込む
  /// もしそのIDのファイルが存在しなかった場合はnullを返す
  static Future<ChatMemoryModel?> readSessionById(String sessionId) async {
    final baseDir = await getApplicationSupportDirectory();
    final sessionFile =
        File('${baseDir.path}/$sessionDirectoryName/$sessionId.json');

    if (await sessionFile.exists()) {
      final contents = await sessionFile.readAsString();
      return ChatMemoryModel.fromJson(json.decode(contents));
    }

    return null;
  }

  /// セッションファイルに書き込む
  static Future<void> writeSession(ChatMemoryModel session) async {
    final baseDir = await getApplicationSupportDirectory();

    final sessionDirectory = Directory('${baseDir.path}/$sessionDirectoryName');
    await sessionDirectory.create(recursive: true);

    final sessionFile = File('${sessionDirectory.path}/${session.uuid}.json');
    await sessionFile.writeAsString(json.encode(session.toJson()));
  }

  /// セッションのIDでセッションを削除する
  static Future<void> removeSessionById(String sessionId) async {
    final baseDir = await getApplicationSupportDirectory();
    final sessionFile =
        File('${baseDir.path}/$sessionDirectoryName/$sessionId.json');
    if (await sessionFile.exists()) {
      await sessionFile.delete();
    }
  }
}
