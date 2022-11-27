import 'package:json_annotation/json_annotation.dart';

part 'local_wallet.g.dart';

@JsonSerializable()
class LocalWallet {
  final String address;
  final String privateKey;
  final String? mnemonic;
  final String name;
  final String password;

  LocalWallet({
    required this.address,
    required this.privateKey,
    this.mnemonic,
    required this.name,
    required this.password,
  });

  factory LocalWallet.fromJson(Map<String, dynamic> json) =>
      _$LocalWalletFromJson(json);

  Map<String, dynamic> toJson() => _$LocalWalletToJson(this);
}
