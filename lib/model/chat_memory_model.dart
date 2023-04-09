import 'dart:convert';

import 'package:dart_openai/openai.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../repository/chat_session_repository.dart';

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
    /// チャットのID
    String? uuid,

    /// チャットメモリの名前
    String? memoryName,

    /// Systemメッセージとして一番最初に送信されるメッセージ (プロンプト)
    String? prefixPrompt,

    /// 過去のチャット履歴を保存するリスト
    @OpenAIChatCompletionChoiceMessageModelConverter()
    @Default([])
        List<OpenAIChatCompletionChoiceMessageModel> chatMemory,
  }) = _ChatMemoryModel;

  factory ChatMemoryModel.fromJson(Map<String, Object?> json) =>
      _$ChatMemoryModelFromJson(json);
}

class ChatMemoryModelNotifer extends StateNotifier<ChatMemoryModel> {
  ChatMemoryModelNotifer(ChatMemoryModel chatMemory) : super(chatMemory) {
    state = state.copyWith(
      uuid: chatMemory.uuid ?? const Uuid().v4(),
    );

    writeToFile();
  }

  /// プレフィックスプロンプトをセットする
  void setPrefixPrompt(String prefixPrompt) async {
    state = state.copyWith(prefixPrompt: prefixPrompt);
    await writeToFile();
  }

  /// チャット履歴にメッセージを追加
  void addMemory(OpenAIChatCompletionChoiceMessageModel message) async {
    state = state.copyWith(chatMemory: [...state.chatMemory, message]);
    await writeToFile();
  }

  /// チャット履歴をクリア
  void clearMemory() async {
    state = state.copyWith(chatMemory: []);
    await writeToFile();
  }

  /// 一番最後の要素のメモリにコンテンツ(文字列)を追加します
  /// Stream用
  void appendLatestMemoryContent(String appendContent) async {
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

    /// あまりに連続で書き込みし続けるのも良くない感じするので
    /// 主にStreamで使われるappendLatestMemoryContentではストレージへの書き込みは行わない
    /// await writeToFile();
  }

  /// チャット履歴を取得
  List<OpenAIChatCompletionChoiceMessageModel> get chatMemory =>
      state.chatMemory;

  /// チャットメモリの名前をセット
  void setMemoryName(String memoryName) async {
    state = state.copyWith(memoryName: memoryName);
    await writeToFile();
  }

  Future<void> writeToFile() async {
    await ChatSessionRepository.writeSession(state);
  }

  /// チャットメモリの名前を取得
  String? get memoryName => state.memoryName;
}
