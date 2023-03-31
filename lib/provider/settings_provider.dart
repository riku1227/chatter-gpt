import 'package:chatter_gpt/model/settings_model.dart';
import 'package:chatter_gpt/repository/preference_repository.dart';
import 'package:dart_openai/openai.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 設定の情報を管理するNotiferプロバイダー
class SettingsNotifer extends StateNotifier<SettingsModel> {
  SettingsNotifer() : super(SettingsModel(apiKey: ""));

  var _isLoaded = false;

  bool get isLoaded => _isLoaded;

  /// 設定を読み込む
  Future<void> loadSettings() async {
    final apiKey = await PreferenceRepository.getOpenAIAPIKey();

    _isLoaded = true;
    state = state.copyWith(
      apiKey: apiKey ?? "",
    );

    /// OpenAIクライアントのAPIキーをセットする
    OpenAI.apiKey = state.apiKey;
  }

  /// APIキーを設定
  /// OpenAI.apiKeyも自動的に更新される
  Future<void> setAPIKey(String apiKey) async {
    state = state.copyWith(apiKey: apiKey);
    OpenAI.apiKey = apiKey;
    await PreferenceRepository.setOpenAIAPIKey(apiKey);
  }

  /// APIキーを取得
  String getAPIKey() {
    return state.apiKey;
  }
}

// 設定の情報が入っているプロバイダー
final settingsProvider = StateNotifierProvider<SettingsNotifer, SettingsModel>(
    (ref) => SettingsNotifer());
