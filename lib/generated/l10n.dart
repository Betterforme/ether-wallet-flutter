// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `test`
  String get test {
    return Intl.message(
      'test',
      name: 'test',
      desc: '',
      args: [],
    );
  }

  /// `Create new wallet`
  String get createNWallet {
    return Intl.message(
      'Create new wallet',
      name: 'createNWallet',
      desc: '',
      args: [],
    );
  }

  /// `change language`
  String get languageChange {
    return Intl.message(
      'change language',
      name: 'languageChange',
      desc: '',
      args: [],
    );
  }

  /// `Ecological`
  String get ecological {
    return Intl.message(
      'Ecological',
      name: 'ecological',
      desc: '',
      args: [],
    );
  }

  /// `DOPS public chain, multi-ecological layout, diversified community`
  String get ecological_desc {
    return Intl.message(
      'DOPS public chain, multi-ecological layout, diversified community',
      name: 'ecological_desc',
      desc: '',
      args: [],
    );
  }

  /// `Safe`
  String get safe {
    return Intl.message(
      'Safe',
      name: 'safe',
      desc: '',
      args: [],
    );
  }

  /// `Decentralized architecture, bottom layer protection, own private key`
  String get safe_desc {
    return Intl.message(
      'Decentralized architecture, bottom layer protection, own private key',
      name: 'safe_desc',
      desc: '',
      args: [],
    );
  }

  /// `Across the chain`
  String get mul_chain {
    return Intl.message(
      'Across the chain',
      name: 'mul_chain',
      desc: '',
      args: [],
    );
  }

  /// `ETH and BSC multi-chain asset cross-chain, strong public chain support`
  String get mul_chain_desc {
    return Intl.message(
      'ETH and BSC multi-chain asset cross-chain, strong public chain support',
      name: 'mul_chain_desc',
      desc: '',
      args: [],
    );
  }

  /// `Import Wallet`
  String get import_wallet {
    return Intl.message(
      'Import Wallet',
      name: 'import_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Setting the Name`
  String get set_name {
    return Intl.message(
      'Setting the Name',
      name: 'set_name',
      desc: '',
      args: [],
    );
  }

  /// `The wallet name is used to help you distinguish between different wallets`
  String get name_used_to {
    return Intl.message(
      'The wallet name is used to help you distinguish between different wallets',
      name: 'name_used_to',
      desc: '',
      args: [],
    );
  }

  /// `The value ranges from 1 to 14 characters`
  String get char_number {
    return Intl.message(
      'The value ranges from 1 to 14 characters',
      name: 'char_number',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Setting password`
  String get set_pwd {
    return Intl.message(
      'Setting password',
      name: 'set_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password again`
  String get reset_pwd {
    return Intl.message(
      'Enter your password again',
      name: 'reset_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Passwords are used to encrypt private keys, transfer money, etc., so strength is important. \\n*Vtimes does not store the password, nor can it help you find, please remember.`
  String get pwd_tips {
    return Intl.message(
      'Passwords are used to encrypt private keys, transfer money, etc., so strength is important. \\\n*Vtimes does not store the password, nor can it help you find, please remember.',
      name: 'pwd_tips',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password.`
  String get input_pwd {
    return Intl.message(
      'Please enter your password.',
      name: 'input_pwd',
      desc: '',
      args: [],
    );
  }

  /// `To protect your assets, the password should consist of: \\n1 uppercase letters \\n1 lowercase letters \\n1 numbers \\n at least 8 characters`
  String get pwd_format {
    return Intl.message(
      'To protect your assets, the password should consist of: \\\n1 uppercase letters \\\n1 lowercase letters \\\n1 numbers \\\n at least 8 characters',
      name: 'pwd_format',
      desc: '',
      args: [],
    );
  }

  /// `Backup mnemonics`
  String get backup_mnemonic {
    return Intl.message(
      'Backup mnemonics',
      name: 'backup_mnemonic',
      desc: '',
      args: [],
    );
  }

  /// `The following is the private key information of the wallet. Obtaining the private key is equivalent to owning the asset of the wallet. Please keep it safely, once it is lost, it will not be recovered`
  String get backup_tips {
    return Intl.message(
      'The following is the private key information of the wallet. Obtaining the private key is equivalent to owning the asset of the wallet. Please keep it safely, once it is lost, it will not be recovered',
      name: 'backup_tips',
      desc: '',
      args: [],
    );
  }

  /// `I've backed it up safely`
  String get already_backup {
    return Intl.message(
      'I\'ve backed it up safely',
      name: 'already_backup',
      desc: '',
      args: [],
    );
  }

  /// `Copy mnemonic`
  String get copy_mnemonic {
    return Intl.message(
      'Copy mnemonic',
      name: 'copy_mnemonic',
      desc: '',
      args: [],
    );
  }

  /// `My`
  String get my {
    return Intl.message(
      'My',
      name: 'my',
      desc: '',
      args: [],
    );
  }

  /// `Market`
  String get market {
    return Intl.message(
      'Market',
      name: 'market',
      desc: '',
      args: [],
    );
  }

  /// `Assets`
  String get assets {
    return Intl.message(
      'Assets',
      name: 'assets',
      desc: '',
      args: [],
    );
  }

  /// `DApp`
  String get dapp {
    return Intl.message(
      'DApp',
      name: 'dapp',
      desc: '',
      args: [],
    );
  }

  /// `Add Wallet`
  String get add_wallet {
    return Intl.message(
      'Add Wallet',
      name: 'add_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Search for the wallet name or public key address`
  String get search_wallet {
    return Intl.message(
      'Search for the wallet name or public key address',
      name: 'search_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Vote/Manager`
  String get vote_manager {
    return Intl.message(
      'Vote/Manager',
      name: 'vote_manager',
      desc: '',
      args: [],
    );
  }

  /// `Quantum`
  String get quantum {
    return Intl.message(
      'Quantum',
      name: 'quantum',
      desc: '',
      args: [],
    );
  }

  /// `Entropy`
  String get entropy {
    return Intl.message(
      'Entropy',
      name: 'entropy',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
