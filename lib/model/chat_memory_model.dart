import 'dart:convert';

import 'package:dart_openai/openai.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_memory_model.freezed.dart';
part 'chat_memory_model.g.dart';

/// OpenAIChatCompletionChoiceMessageModelをJsonに変換するクラス
class OpenAIChatCompletionChoiceMessageModelConverter
    implements JsonConverter<OpenAIChatCompletionChoiceMessageModel, String> {
  const OpenAIChatCompletionChoiceMessageModelConverter();

  @override
  OpenAIChatCompletionChoiceMessageModel fromJson(String json) {
    return OpenAIChatCompletionChoiceMessageModel.fromMap(jsonDecode(json));
  }

  @override
  String toJson(OpenAIChatCompletionChoiceMessageModel object) {
    return jsonEncode(object.toMap());
  }
}

@freezed
class ChatMemoryModel with _$ChatMemoryModel {
  factory ChatMemoryModel({
    /// Systemメッセージとして一番最初に送信されるメッセージ (プロンプト)
    required String prefixPrompt,

    /// 過去のチャット履歴を保存するリスト
    @OpenAIChatCompletionChoiceMessageModelConverter()
    @Default([])
        List<OpenAIChatCompletionChoiceMessageModel> chatMemory,
  }) = _ChatMemoryModel;

  factory ChatMemoryModel.fromJson(Map<String, Object?> json) =>
      _$ChatMemoryModelFromJson(json);
}

class ChatMemoryModelNotifer extends StateNotifier<ChatMemoryModel> {
  ChatMemoryModelNotifer() : super(ChatMemoryModel(prefixPrompt: ""));

  /// プレフィックスプロンプトをセットする
  void setPrefixPrompt(String prefixPrompt) {
    state = state.copyWith(prefixPrompt: prefixPrompt);
  }

  /// チャット履歴にメッセージを追加
  void addMemory(OpenAIChatCompletionChoiceMessageModel message) {
    state = state.copyWith(chatMemory: [...state.chatMemory, message]);
  }

  /// チャット履歴をクリア
  void clearMemory() {
    state = state.copyWith(chatMemory: []);
  }

  /// 一番最後の要素のメモリにコンテンツ(文字列)を追加します
  /// Stream用
  void appendLatestMemoryContent(String appendContent) {
    // 一番最新(配列の最後にある)の履歴を取得する
    final latestMemort = state.chatMemory.last;

    /// 一番最後以外の要素を持った配列と、
    /// 一番最後のメッセージにアペンドコンテンツを追加した記憶で
    /// 配列を作成する
    state = state.copyWith(chatMemory: [
      ...state.chatMemory.sublist(0, state.chatMemory.length - 1),
      OpenAIChatCompletionChoiceMessageModel(
          role: latestMemort.role,
          content: latestMemort.content + appendContent),
    ]);
  }

  /// チャット履歴を取得
  List<OpenAIChatCompletionChoiceMessageModel> get chatMemory =>
      state.chatMemory;
}
