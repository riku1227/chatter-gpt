// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatMessageModel _$$_ChatMessageModelFromJson(Map<String, dynamic> json) =>
    _$_ChatMessageModel(
      prefixPrompt: json['prefixPrompt'] as String,
      chatMemory: (json['chatMemory'] as List<dynamic>?)
              ?.map((e) => const OpenAIChatMessageRoleEnumConverter()
                  .fromJson(e as String))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ChatMessageModelToJson(_$_ChatMessageModel instance) =>
    <String, dynamic>{
      'prefixPrompt': instance.prefixPrompt,
      'chatMemory': instance.chatMemory
          .map(const OpenAIChatMessageRoleEnumConverter().toJson)
          .toList(),
    };
