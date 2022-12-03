import 'dart:convert';

import 'package:etherwallet/model/local_wallet.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    final wallet = getLocalWalletList();
    if (wallet.isNotEmpty) {
      currentWallet = getCurrentWallet();
    }
    return wallet.isNotEmpty;
  }

  @override
  Future<bool> setWallet(LocalWallet wallet) async {
    final List<LocalWallet> walletList = getLocalWalletList();
    final List<String>? walletListJson =
        _preferences.getStringList('localWallet');

    if (walletList.isNotEmpty && walletListJson != null) {
      bool hasAddressContain = false;
      bool hasNameContain = false;
      for (final element in walletList) {
        if (element.address == wallet.address) {
          hasAddressContain = true;
        }
        if (element.name == wallet.name) {
          hasNameContain = true;
        }
      }
      if (hasAddressContain) {
        Fluttertoast.showToast(msg: 'Wallet has contain');
        return false;
      } else if (hasNameContain) {
        Fluttertoast.showToast(msg: 'Wallet name has contain');
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

  LocalWallet getCurrentWallet() {
    late LocalWallet wallet;
    for (final element in getLocalWalletList()) {
      if (element.selected == true) {
        wallet = element;
        break;
      }
    }
    return wallet;
  }

  void setCurrentWallet(LocalWallet wallet) {
    wallet.selected = true;
    currentWallet = wallet;
    final List<LocalWallet> wallets = getLocalWalletList();
    for (final element in wallets) {
      if (element.privateKey.toLowerCase() == wallet.privateKey.toLowerCase()) {
        element.selected = true;
      } else {
        element.selected = false;
      }
    }
    final walletJsonList =
        wallets.map((e) => const JsonEncoder().convert(e.toJson())).toList();
    _preferences.setStringList('localWallet', walletJsonList);
  }
}

late LocalWallet currentWallet;
