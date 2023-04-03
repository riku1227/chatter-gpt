// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) {
  return _ChatMessageModel.fromJson(json);
}

/// @nodoc
mixin _$ChatMessageModel {
  String get prefixPrompt => throw _privateConstructorUsedError;
  @OpenAIChatMessageRoleEnumConverter()
  List<OpenAIChatMessageRole> get chatMemory =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessageModelCopyWith<ChatMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageModelCopyWith<$Res> {
  factory $ChatMessageModelCopyWith(
          ChatMessageModel value, $Res Function(ChatMessageModel) then) =
      _$ChatMessageModelCopyWithImpl<$Res, ChatMessageModel>;
  @useResult
  $Res call(
      {String prefixPrompt,
      @OpenAIChatMessageRoleEnumConverter()
          List<OpenAIChatMessageRole> chatMemory});
}

/// @nodoc
class _$ChatMessageModelCopyWithImpl<$Res, $Val extends ChatMessageModel>
    implements $ChatMessageModelCopyWith<$Res> {
  _$ChatMessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prefixPrompt = null,
    Object? chatMemory = null,
  }) {
    return _then(_value.copyWith(
      prefixPrompt: null == prefixPrompt
          ? _value.prefixPrompt
          : prefixPrompt // ignore: cast_nullable_to_non_nullable
              as String,
      chatMemory: null == chatMemory
          ? _value.chatMemory
          : chatMemory // ignore: cast_nullable_to_non_nullable
              as List<OpenAIChatMessageRole>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatMessageModelCopyWith<$Res>
    implements $ChatMessageModelCopyWith<$Res> {
  factory _$$_ChatMessageModelCopyWith(
          _$_ChatMessageModel value, $Res Function(_$_ChatMessageModel) then) =
      __$$_ChatMessageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String prefixPrompt,
      @OpenAIChatMessageRoleEnumConverter()
          List<OpenAIChatMessageRole> chatMemory});
}

/// @nodoc
class __$$_ChatMessageModelCopyWithImpl<$Res>
    extends _$ChatMessageModelCopyWithImpl<$Res, _$_ChatMessageModel>
    implements _$$_ChatMessageModelCopyWith<$Res> {
  __$$_ChatMessageModelCopyWithImpl(
      _$_ChatMessageModel _value, $Res Function(_$_ChatMessageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prefixPrompt = null,
    Object? chatMemory = null,
  }) {
    return _then(_$_ChatMessageModel(
      prefixPrompt: null == prefixPrompt
          ? _value.prefixPrompt
          : prefixPrompt // ignore: cast_nullable_to_non_nullable
              as String,
      chatMemory: null == chatMemory
          ? _value._chatMemory
          : chatMemory // ignore: cast_nullable_to_non_nullable
              as List<OpenAIChatMessageRole>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatMessageModel implements _ChatMessageModel {
  _$_ChatMessageModel(
      {required this.prefixPrompt,
      @OpenAIChatMessageRoleEnumConverter()
          final List<OpenAIChatMessageRole> chatMemory = const []})
      : _chatMemory = chatMemory;

  factory _$_ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatMessageModelFromJson(json);

  @override
  final String prefixPrompt;
  final List<OpenAIChatMessageRole> _chatMemory;
  @override
  @JsonKey()
  @OpenAIChatMessageRoleEnumConverter()
  List<OpenAIChatMessageRole> get chatMemory {
    if (_chatMemory is EqualUnmodifiableListView) return _chatMemory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatMemory);
  }

  @override
  String toString() {
    return 'ChatMessageModel(prefixPrompt: $prefixPrompt, chatMemory: $chatMemory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatMessageModel &&
            (identical(other.prefixPrompt, prefixPrompt) ||
                other.prefixPrompt == prefixPrompt) &&
            const DeepCollectionEquality()
                .equals(other._chatMemory, _chatMemory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, prefixPrompt,
      const DeepCollectionEquality().hash(_chatMemory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatMessageModelCopyWith<_$_ChatMessageModel> get copyWith =>
      __$$_ChatMessageModelCopyWithImpl<_$_ChatMessageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatMessageModelToJson(
      this,
    );
  }
}

abstract class _ChatMessageModel implements ChatMessageModel {
  factory _ChatMessageModel(
      {required final String prefixPrompt,
      @OpenAIChatMessageRoleEnumConverter()
          final List<OpenAIChatMessageRole> chatMemory}) = _$_ChatMessageModel;

  factory _ChatMessageModel.fromJson(Map<String, dynamic> json) =
      _$_ChatMessageModel.fromJson;

  @override
  String get prefixPrompt;
  @override
  @OpenAIChatMessageRoleEnumConverter()
  List<OpenAIChatMessageRole> get chatMemory;
  @override
  @JsonKey(ignore: true)
  _$$_ChatMessageModelCopyWith<_$_ChatMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
