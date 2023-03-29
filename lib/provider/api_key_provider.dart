import 'package:dart_openai/openai.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// APIキーを管理するNotiferプロバイダー
class APIKeyNotifier extends StateNotifier<String> {
  APIKeyNotifier() : super("");

  /// APIキーを設定
  /// OpenAI.apiKeyも自動的に更新される
  void setAPIKey(String apiKey) {
    state = apiKey;
    OpenAI.apiKey = apiKey;
  }

  /// APIキーを取得
  String getAPIKey() {
    return state;
  }
}

// APIキーが入っているプロバイダー
final apiKeyProvider =
    StateNotifierProvider<APIKeyNotifier, String>((ref) => APIKeyNotifier());
