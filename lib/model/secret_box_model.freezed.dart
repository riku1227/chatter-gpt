// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'secret_box_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SecretBoxModel _$SecretBoxModelFromJson(Map<String, dynamic> json) {
  return _SecretBoxModel.fromJson(json);
}

/// @nodoc
mixin _$SecretBoxModel {
  List<int> get cipherText => throw _privateConstructorUsedError;
  List<int> get nonce => throw _privateConstructorUsedError;
  List<int> get mac => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SecretBoxModelCopyWith<SecretBoxModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecretBoxModelCopyWith<$Res> {
  factory $SecretBoxModelCopyWith(
          SecretBoxModel value, $Res Function(SecretBoxModel) then) =
      _$SecretBoxModelCopyWithImpl<$Res, SecretBoxModel>;
  @useResult
  $Res call({List<int> cipherText, List<int> nonce, List<int> mac});
}

/// @nodoc
class _$SecretBoxModelCopyWithImpl<$Res, $Val extends SecretBoxModel>
    implements $SecretBoxModelCopyWith<$Res> {
  _$SecretBoxModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cipherText = null,
    Object? nonce = null,
    Object? mac = null,
  }) {
    return _then(_value.copyWith(
      cipherText: null == cipherText
          ? _value.cipherText
          : cipherText // ignore: cast_nullable_to_non_nullable
              as List<int>,
      nonce: null == nonce
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as List<int>,
      mac: null == mac
          ? _value.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SecretBoxModelCopyWith<$Res>
    implements $SecretBoxModelCopyWith<$Res> {
  factory _$$_SecretBoxModelCopyWith(
          _$_SecretBoxModel value, $Res Function(_$_SecretBoxModel) then) =
      __$$_SecretBoxModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> cipherText, List<int> nonce, List<int> mac});
}

/// @nodoc
class __$$_SecretBoxModelCopyWithImpl<$Res>
    extends _$SecretBoxModelCopyWithImpl<$Res, _$_SecretBoxModel>
    implements _$$_SecretBoxModelCopyWith<$Res> {
  __$$_SecretBoxModelCopyWithImpl(
      _$_SecretBoxModel _value, $Res Function(_$_SecretBoxModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cipherText = null,
    Object? nonce = null,
    Object? mac = null,
  }) {
    return _then(_$_SecretBoxModel(
      cipherText: null == cipherText
          ? _value._cipherText
          : cipherText // ignore: cast_nullable_to_non_nullable
              as List<int>,
      nonce: null == nonce
          ? _value._nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as List<int>,
      mac: null == mac
          ? _value._mac
          : mac // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SecretBoxModel implements _SecretBoxModel {
  _$_SecretBoxModel(
      {required final List<int> cipherText,
      required final List<int> nonce,
      required final List<int> mac})
      : _cipherText = cipherText,
        _nonce = nonce,
        _mac = mac;

  factory _$_SecretBoxModel.fromJson(Map<String, dynamic> json) =>
      _$$_SecretBoxModelFromJson(json);

  final List<int> _cipherText;
  @override
  List<int> get cipherText {
    if (_cipherText is EqualUnmodifiableListView) return _cipherText;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cipherText);
  }

  final List<int> _nonce;
  @override
  List<int> get nonce {
    if (_nonce is EqualUnmodifiableListView) return _nonce;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nonce);
  }

  final List<int> _mac;
  @override
  List<int> get mac {
    if (_mac is EqualUnmodifiableListView) return _mac;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mac);
  }

  @override
  String toString() {
    return 'SecretBoxModel(cipherText: $cipherText, nonce: $nonce, mac: $mac)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SecretBoxModel &&
            const DeepCollectionEquality()
                .equals(other._cipherText, _cipherText) &&
            const DeepCollectionEquality().equals(other._nonce, _nonce) &&
            const DeepCollectionEquality().equals(other._mac, _mac));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cipherText),
      const DeepCollectionEquality().hash(_nonce),
      const DeepCollectionEquality().hash(_mac));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SecretBoxModelCopyWith<_$_SecretBoxModel> get copyWith =>
      __$$_SecretBoxModelCopyWithImpl<_$_SecretBoxModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SecretBoxModelToJson(
      this,
    );
  }
}

abstract class _SecretBoxModel implements SecretBoxModel {
  factory _SecretBoxModel(
      {required final List<int> cipherText,
      required final List<int> nonce,
      required final List<int> mac}) = _$_SecretBoxModel;

  factory _SecretBoxModel.fromJson(Map<String, dynamic> json) =
      _$_SecretBoxModel.fromJson;

  @override
  List<int> get cipherText;
  @override
  List<int> get nonce;
  @override
  List<int> get mac;
  @override
  @JsonKey(ignore: true)
  _$$_SecretBoxModelCopyWith<_$_SecretBoxModel> get copyWith =>
      throw _privateConstructorUsedError;
}
