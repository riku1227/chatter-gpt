// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_memory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatMemoryModel _$ChatMemoryModelFromJson(Map<String, dynamic> json) {
  return _ChatMemoryModel.fromJson(json);
}

/// @nodoc
mixin _$ChatMemoryModel {
  /// チャットのID
  String? get uuid => throw _privateConstructorUsedError;

  /// チャットメモリの名前
  String? get memoryName => throw _privateConstructorUsedError;

  /// Systemメッセージとして一番最初に送信されるメッセージ (プロンプト)
  String? get prefixPrompt => throw _privateConstructorUsedError;

  /// 過去のチャット履歴を保存するリスト
  @OpenAIChatCompletionChoiceMessageModelConverter()
  List<OpenAIChatCompletionChoiceMessageModel> get chatMemory =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMemoryModelCopyWith<ChatMemoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMemoryModelCopyWith<$Res> {
  factory $ChatMemoryModelCopyWith(
          ChatMemoryModel value, $Res Function(ChatMemoryModel) then) =
      _$ChatMemoryModelCopyWithImpl<$Res, ChatMemoryModel>;
  @useResult
  $Res call(
      {String? uuid,
      String? memoryName,
      String? prefixPrompt,
      @OpenAIChatCompletionChoiceMessageModelConverter()
          List<OpenAIChatCompletionChoiceMessageModel> chatMemory});
}

/// @nodoc
class _$ChatMemoryModelCopyWithImpl<$Res, $Val extends ChatMemoryModel>
    implements $ChatMemoryModelCopyWith<$Res> {
  _$ChatMemoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? memoryName = freezed,
    Object? prefixPrompt = freezed,
    Object? chatMemory = null,
  }) {
    return _then(_value.copyWith(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      memoryName: freezed == memoryName
          ? _value.memoryName
          : memoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      prefixPrompt: freezed == prefixPrompt
          ? _value.prefixPrompt
          : prefixPrompt // ignore: cast_nullable_to_non_nullable
              as String?,
      chatMemory: null == chatMemory
          ? _value.chatMemory
          : chatMemory // ignore: cast_nullable_to_non_nullable
              as List<OpenAIChatCompletionChoiceMessageModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatMemoryModelCopyWith<$Res>
    implements $ChatMemoryModelCopyWith<$Res> {
  factory _$$_ChatMemoryModelCopyWith(
          _$_ChatMemoryModel value, $Res Function(_$_ChatMemoryModel) then) =
      __$$_ChatMemoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uuid,
      String? memoryName,
      String? prefixPrompt,
      @OpenAIChatCompletionChoiceMessageModelConverter()
          List<OpenAIChatCompletionChoiceMessageModel> chatMemory});
}

/// @nodoc
class __$$_ChatMemoryModelCopyWithImpl<$Res>
    extends _$ChatMemoryModelCopyWithImpl<$Res, _$_ChatMemoryModel>
    implements _$$_ChatMemoryModelCopyWith<$Res> {
  __$$_ChatMemoryModelCopyWithImpl(
      _$_ChatMemoryModel _value, $Res Function(_$_ChatMemoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? memoryName = freezed,
    Object? prefixPrompt = freezed,
    Object? chatMemory = null,
  }) {
    return _then(_$_ChatMemoryModel(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      memoryName: freezed == memoryName
          ? _value.memoryName
          : memoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      prefixPrompt: freezed == prefixPrompt
          ? _value.prefixPrompt
          : prefixPrompt // ignore: cast_nullable_to_non_nullable
              as String?,
      chatMemory: null == chatMemory
          ? _value._chatMemory
          : chatMemory // ignore: cast_nullable_to_non_nullable
              as List<OpenAIChatCompletionChoiceMessageModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatMemoryModel implements _ChatMemoryModel {
  _$_ChatMemoryModel(
      {this.uuid,
      this.memoryName,
      this.prefixPrompt,
      @OpenAIChatCompletionChoiceMessageModelConverter()
          final List<OpenAIChatCompletionChoiceMessageModel>
              chatMemory = const []})
      : _chatMemory = chatMemory;

  factory _$_ChatMemoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatMemoryModelFromJson(json);

  /// チャットのID
  @override
  final String? uuid;

  /// チャットメモリの名前
  @override
  final String? memoryName;

  /// Systemメッセージとして一番最初に送信されるメッセージ (プロンプト)
  @override
  final String? prefixPrompt;

  /// 過去のチャット履歴を保存するリスト
  final List<OpenAIChatCompletionChoiceMessageModel> _chatMemory;

  /// 過去のチャット履歴を保存するリスト
  @override
  @JsonKey()
  @OpenAIChatCompletionChoiceMessageModelConverter()
  List<OpenAIChatCompletionChoiceMessageModel> get chatMemory {
    if (_chatMemory is EqualUnmodifiableListView) return _chatMemory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatMemory);
  }

  @override
  String toString() {
    return 'ChatMemoryModel(uuid: $uuid, memoryName: $memoryName, prefixPrompt: $prefixPrompt, chatMemory: $chatMemory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatMemoryModel &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.memoryName, memoryName) ||
                other.memoryName == memoryName) &&
            (identical(other.prefixPrompt, prefixPrompt) ||
                other.prefixPrompt == prefixPrompt) &&
            const DeepCollectionEquality()
                .equals(other._chatMemory, _chatMemory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, memoryName, prefixPrompt,
      const DeepCollectionEquality().hash(_chatMemory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatMemoryModelCopyWith<_$_ChatMemoryModel> get copyWith =>
      __$$_ChatMemoryModelCopyWithImpl<_$_ChatMemoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatMemoryModelToJson(
      this,
    );
  }
}

abstract class _ChatMemoryModel implements ChatMemoryModel {
  factory _ChatMemoryModel(
          {final String? uuid,
          final String? memoryName,
          final String? prefixPrompt,
          @OpenAIChatCompletionChoiceMessageModelConverter()
              final List<OpenAIChatCompletionChoiceMessageModel> chatMemory}) =
      _$_ChatMemoryModel;

  factory _ChatMemoryModel.fromJson(Map<String, dynamic> json) =
      _$_ChatMemoryModel.fromJson;

  @override

  /// チャットのID
  String? get uuid;
  @override

  /// チャットメモリの名前
  String? get memoryName;
  @override

  /// Systemメッセージとして一番最初に送信されるメッセージ (プロンプト)
  String? get prefixPrompt;
  @override

  /// 過去のチャット履歴を保存するリスト
  @OpenAIChatCompletionChoiceMessageModelConverter()
  List<OpenAIChatCompletionChoiceMessageModel> get chatMemory;
  @override
  @JsonKey(ignore: true)
  _$$_ChatMemoryModelCopyWith<_$_ChatMemoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
