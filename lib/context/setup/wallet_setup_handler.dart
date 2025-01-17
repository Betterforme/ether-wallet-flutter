import 'dart:async';

import 'package:etherwallet/Constants.dart';
import 'package:etherwallet/model/wallet_setup.dart';
import 'package:etherwallet/service/address_service.dart';
import 'package:etherwallet/service/configuration_service.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../model/local_wallet.dart';
import 'wallet_setup_state.dart';

class WalletSetupHandler {
  WalletSetupHandler(
      this._store, this._addressService, this._configurationService);

  final Store<WalletSetup, WalletSetupAction> _store;
  final AddressService _addressService;
  final ConfigurationService _configurationService;

  WalletSetup get state => _store.state;

  String generateMnemonic() {
    final mnemonic = _addressService.generateMnemonic();
    _store.dispatch(WalletSetupConfirmMnemonic(mnemonic));
    return mnemonic;
  }

  Future<bool> confirmMnemonic(String mnemonic) async {
    if (state.mnemonic != mnemonic) {
      _store
          .dispatch(WalletSetupAddError('Invalid mnemonic, please try again.'));
      return false;
    }
    _store.dispatch(WalletSetupStarted());

    await _addressService.setupFromMnemonic(mnemonic);

    return true;
  }

  void goto(WalletCreateSteps step) {
    _store.dispatch(WalletSetupChangeStep(step));
  }

  Future<bool> importFromMnemonic(String mnemonic) async {
    try {
      _store.dispatch(WalletSetupStarted());

      if (_validateMnemonic(mnemonic)) {
        final normalisedMnemonic = _mnemonicNormalise(mnemonic);
        await _addressService.setupFromMnemonic(normalisedMnemonic);
        return true;
      }
    } catch (e) {
      _store.dispatch(WalletSetupAddError(e.toString()));
    }

    _store.dispatch(
        WalletSetupAddError('Invalid mnemonic, it requires 12 words.'));

    return false;
  }

  Future<LocalWallet> generateWalletByMnemonic(
      String mnemonic, String name, String password) async {
    final privateKey = await _addressService.getPrivateKey(mnemonic);
    final address = await _addressService.getPublicAddress(privateKey);
    return LocalWallet(
        mnemonic: mnemonic,
        address: address.hexEip55,
        privateKey: privateKey,
        name: name,
        password: password);
  }

  Future<bool> saveWallet(LocalWallet wallet) async {
    return _configurationService.setWallet(wallet);
  }

  List<LocalWallet> getWallet() {
    return _configurationService.getLocalWalletList();
  }

  void setCurrentWallet(LocalWallet wallet) {
    _configurationService.setCurrentWallet(wallet);
  }

  Future<bool> importFromPrivateKey(String privateKey) async {
    try {
      _store.dispatch(WalletSetupStarted());

      await _addressService.setupFromPrivateKey(privateKey);
      return true;
    } catch (e) {
      _store.dispatch(WalletSetupAddError(e.toString()));
    }

    _store.dispatch(
        WalletSetupAddError('Invalid private key, please try again.'));

    return false;
  }

  String _mnemonicNormalise(String mnemonic) {
    return _mnemonicWords(mnemonic).join(' ');
  }

  List<String> _mnemonicWords(String mnemonic) {
    return mnemonic
        .split(' ')
        .where((item) => item != null && item.trim().isNotEmpty)
        .map((item) => item.trim())
        .toList();
  }

  bool _validateMnemonic(String mnemonic) {
    return _mnemonicWords(mnemonic).length == 12;
  }
}
