// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_memory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatMemoryModel _$$_ChatMemoryModelFromJson(Map<String, dynamic> json) =>
    _$_ChatMemoryModel(
      prefixPrompt: json['prefixPrompt'] as String,
      chatMemory: (json['chatMemory'] as List<dynamic>?)
              ?.map((e) =>
                  const OpenAIChatCompletionChoiceMessageModelConverter()
                      .fromJson(e as String))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ChatMemoryModelToJson(_$_ChatMemoryModel instance) =>
    <String, dynamic>{
      'prefixPrompt': instance.prefixPrompt,
      'chatMemory': instance.chatMemory
          .map(const OpenAIChatCompletionChoiceMessageModelConverter().toJson)
          .toList(),
    };
