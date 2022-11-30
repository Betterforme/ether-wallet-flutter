// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add_wallet": MessageLookupByLibrary.simpleMessage("Add Wallet"),
        "already_backup":
            MessageLookupByLibrary.simpleMessage("I\'ve backed it up safely"),
        "assets": MessageLookupByLibrary.simpleMessage("Assets"),
        "backup_mnemonic":
            MessageLookupByLibrary.simpleMessage("Backup mnemonics"),
        "backup_tips": MessageLookupByLibrary.simpleMessage(
            "The following is the private key information of the wallet. Obtaining the private key is equivalent to owning the asset of the wallet. Please keep it safely, once it is lost, it will not be recovered"),
        "char_number": MessageLookupByLibrary.simpleMessage(
            "The value ranges from 1 to 14 characters"),
        "copy_mnemonic": MessageLookupByLibrary.simpleMessage("Copy mnemonic"),
        "createNWallet":
            MessageLookupByLibrary.simpleMessage("Create new wallet"),
        "dapp": MessageLookupByLibrary.simpleMessage("DApp"),
        "ecological": MessageLookupByLibrary.simpleMessage("Ecological"),
        "ecological_desc": MessageLookupByLibrary.simpleMessage(
            "DOPS public chain, multi-ecological layout, diversified community"),
        "import_wallet": MessageLookupByLibrary.simpleMessage("Import Wallet"),
        "input_pwd":
            MessageLookupByLibrary.simpleMessage("Please enter your password."),
        "languageChange":
            MessageLookupByLibrary.simpleMessage("change language"),
        "market": MessageLookupByLibrary.simpleMessage("Market"),
        "mul_chain": MessageLookupByLibrary.simpleMessage("Across the chain"),
        "mul_chain_desc": MessageLookupByLibrary.simpleMessage(
            "ETH and BSC multi-chain asset cross-chain, strong public chain support"),
        "my": MessageLookupByLibrary.simpleMessage("My"),
        "name_used_to": MessageLookupByLibrary.simpleMessage(
            "The wallet name is used to help you distinguish between different wallets"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "pwd_format": MessageLookupByLibrary.simpleMessage(
            "To protect your assets, the password should consist of: \\\n1 uppercase letters \\\n1 lowercase letters \\\n1 numbers \\\n at least 8 characters"),
        "pwd_tips": MessageLookupByLibrary.simpleMessage(
            "Passwords are used to encrypt private keys, transfer money, etc., so strength is important. \\\n*Vtimes does not store the password, nor can it help you find, please remember."),
        "reset_pwd":
            MessageLookupByLibrary.simpleMessage("Enter your password again"),
        "safe": MessageLookupByLibrary.simpleMessage("Safe"),
        "safe_desc": MessageLookupByLibrary.simpleMessage(
            "Decentralized architecture, bottom layer protection, own private key"),
        "search_wallet": MessageLookupByLibrary.simpleMessage(
            "Search for the wallet name or public key address"),
        "set_name": MessageLookupByLibrary.simpleMessage("Setting the Name"),
        "set_pwd": MessageLookupByLibrary.simpleMessage("Setting password"),
        "test": MessageLookupByLibrary.simpleMessage("test")
      };
}
