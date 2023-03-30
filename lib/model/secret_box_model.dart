import 'package:cryptography/cryptography.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'secret_box_model.freezed.dart';
part 'secret_box_model.g.dart';

/// cryptographyのSecretBoxをJsonで良い感じにできるように、freezedでモデル化したクラス
@freezed
class SecretBoxModel with _$SecretBoxModel {
  factory SecretBoxModel({
    required List<int> cipherText,
    required List<int> nonce,
    required List<int> mac,
  }) = _SecretBoxModel;

  factory SecretBoxModel.fromJson(Map<String, Object?> json) =>
      _$SecretBoxModelFromJson(json);
}

/// 双方向で良い感じに変換できるようにのexntesion
extension SecretBoxModelX on SecretBoxModel {
  SecretBox toSecretBox() {
    return SecretBox(
      cipherText,
      nonce: nonce,
      mac: Mac(mac),
    );
  }
}

extension SecretBoxX on SecretBox {
  SecretBoxModel toSecretModel() {
    return SecretBoxModel(
      cipherText: cipherText,
      nonce: nonce,
      mac: mac.bytes,
    );
  }
}
