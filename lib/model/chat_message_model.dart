import 'package:dart_openai/openai.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

class OpenAIChatMessageRoleEnumConverter
    implements JsonConverter<OpenAIChatMessageRole, String> {
  const OpenAIChatMessageRoleEnumConverter();

  @override
  OpenAIChatMessageRole fromJson(String json) {
    return OpenAIChatMessageRole.values
        .firstWhere((element) => element.name == json);
  }

  @override
  String toJson(OpenAIChatMessageRole object) {
    return object.name;
  }
}

@freezed
class ChatMessageModel with _$ChatMessageModel {
  factory ChatMessageModel({
    required String prefixPrompt,
    @OpenAIChatMessageRoleEnumConverter()
    @Default([])
        List<OpenAIChatMessageRole> chatMemory,
  }) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, Object?> json) =>
      _$ChatMessageModelFromJson(json);
}
