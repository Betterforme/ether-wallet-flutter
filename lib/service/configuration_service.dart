import 'dart:convert';

import 'package:etherwallet/model/local_wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IConfigurationService {
  Future<void> setMnemonic(String? value);

  Future<void> setupDone(bool value);

  Future<void> setPrivateKey(String? value);

  Future<void> setWallet(LocalWallet value);

  String? getMnemonic();

  String? getPrivateKey();

  bool didSetupWallet();

  List<LocalWallet> getLocalWalletList();
}

class ConfigurationService implements IConfigurationService {
  const ConfigurationService(this._preferences);

  final SharedPreferences _preferences;

  @override
  Future<void> setMnemonic(String? value) async {
    await _preferences.setString('mnemonic', value ?? '');
  }

  @override
  Future<void> setPrivateKey(String? value) async {
    await _preferences.setString('privateKey', value ?? '');
  }

  @override
  Future<void> setupDone(bool value) async {
    await _preferences.setBool('didSetupWallet', value);
  }

  // gets
  @override
  String? getMnemonic() {
    return _preferences.getString('mnemonic');
  }

  @override
  String? getPrivateKey() {
    return _preferences.getString('privateKey');
  }

  @override
  bool didSetupWallet() {
    return _preferences.getBool('didSetupWallet') ?? false;
  }

  @override
  Future<bool> setWallet(LocalWallet wallet) async {
    final List<LocalWallet> walletList = getLocalWalletList();
    final List<String>? walletListJson =
        _preferences.getStringList('localWallet');

    if (walletList.isNotEmpty && walletListJson != null) {
      bool hasContain = false;
      for (final element in walletList) {
        if (element.address == wallet.address) {
          hasContain = true;
        }
      }
      if (hasContain) {
        return false;
      } else {
        walletListJson.add(const JsonEncoder().convert(wallet.toJson()));
        _preferences.setStringList('localWallet', walletListJson);
        return true;
      }
    } else {
      final List<String> current = <String>[];
      current.add(jsonEncode(wallet.toJson()));
      _preferences.setStringList('localWallet', current);
      return true;
    }

  }

  @override
  List<LocalWallet> getLocalWalletList() {
    final List<String>? walletListJson =
        _preferences.getStringList('localWallet');
    final List<LocalWallet> walletList = <LocalWallet>[];

    if (walletListJson != null) {
      for (final element in walletListJson) {
        walletList.add(LocalWallet.fromJson(
            const JsonDecoder().convert(element) as Map<String, dynamic>));
      }
    }
    return walletList;
  }
}
