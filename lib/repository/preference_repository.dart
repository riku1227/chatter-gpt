import 'dart:convert';

import 'package:chatter_gpt/model/secret_box_model.dart';
import 'package:cryptography/cryptography.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferencesに保存しているデータを操作するリポジトリクラス
class PreferenceRepository {
  static final _apiEncryptAlgorithm =
      AesCbc.with128bits(macAlgorithm: Hmac.sha256());
  static final _apiSecretKey = [1, 2, 2, 7, 0, 8, 1, 6, 1, 2, 1, 4, 0, 5, 1, 2];

  static Future<String?> getOpenAIAPIKey() async {
    final preference = await SharedPreferences.getInstance();

    final apiKeyJson = preference.getString("open_ai_api_key");

    if (apiKeyJson == null) {
      return null;
    }

    // Preferenceに保存されてるJson文字列からSecretBoxを作成
    final secretBox =
        SecretBoxModel.fromJson(json.decode(apiKeyJson)).toSecretBox();

    // 複合するためのSecretKeyを作成
    final secretKey =
        await _apiEncryptAlgorithm.newSecretKeyFromBytes(_apiSecretKey);

    // 複合したAPIキーの文字列を返す
    return _apiEncryptAlgorithm.decryptString(secretBox, secretKey: secretKey);
  }

  static Future<void> setOpenAIAPIKey(String apiKey) async {
    final preference = await SharedPreferences.getInstance();

    // 暗号化するためのSecretKeyを作成
    final secretKey =
        await _apiEncryptAlgorithm.newSecretKeyFromBytes(_apiSecretKey);

    // APIキーを暗号化
    final encryptStr =
        await _apiEncryptAlgorithm.encryptString(apiKey, secretKey: secretKey);

    // PreferenceにJson文字列にして保存
    preference.setString(
        "open_ai_api_key", json.encode(encryptStr.toSecretModel()));
  }
}
