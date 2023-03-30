// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secret_box_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SecretBoxModel _$$_SecretBoxModelFromJson(Map<String, dynamic> json) =>
    _$_SecretBoxModel(
      cipherText:
          (json['cipherText'] as List<dynamic>).map((e) => e as int).toList(),
      nonce: (json['nonce'] as List<dynamic>).map((e) => e as int).toList(),
      mac: (json['mac'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_SecretBoxModelToJson(_$_SecretBoxModel instance) =>
    <String, dynamic>{
      'cipherText': instance.cipherText,
      'nonce': instance.nonce,
      'mac': instance.mac,
    };
