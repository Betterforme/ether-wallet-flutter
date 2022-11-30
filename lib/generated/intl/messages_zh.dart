// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
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
  String get localeName => 'zh';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add_wallet": MessageLookupByLibrary.simpleMessage("添加钱包"),
        "already_backup": MessageLookupByLibrary.simpleMessage("我已安全备份"),
        "assets": MessageLookupByLibrary.simpleMessage("资产"),
        "backup_mnemonic": MessageLookupByLibrary.simpleMessage("备份助记词"),
        "backup_tips": MessageLookupByLibrary.simpleMessage(
            "以下是钱包的私钥信息，获得私钥等于拥有钱包资产所有权，请安全保存，一旦丢失将无法找回"),
        "char_number": MessageLookupByLibrary.simpleMessage("1-14个字符"),
        "copy_mnemonic": MessageLookupByLibrary.simpleMessage("复制助记词"),
        "createNWallet": MessageLookupByLibrary.simpleMessage("创建钱包"),
        "dapp": MessageLookupByLibrary.simpleMessage("应用"),
        "ecological": MessageLookupByLibrary.simpleMessage("生态"),
        "ecological_desc":
            MessageLookupByLibrary.simpleMessage("DOPS公链，多生态布局，多元化社区"),
        "import_wallet": MessageLookupByLibrary.simpleMessage("导入钱包"),
        "input_pwd": MessageLookupByLibrary.simpleMessage("请输入密码"),
        "languageChange": MessageLookupByLibrary.simpleMessage("语言切换"),
        "market": MessageLookupByLibrary.simpleMessage("行情"),
        "mul_chain": MessageLookupByLibrary.simpleMessage("跨链"),
        "mul_chain_desc":
            MessageLookupByLibrary.simpleMessage("ETH、BSC多链资产跨链，强大的公链支持"),
        "my": MessageLookupByLibrary.simpleMessage("我的"),
        "name_used_to":
            MessageLookupByLibrary.simpleMessage("钱包名称用于帮助您区分不同的钱包"),
        "next": MessageLookupByLibrary.simpleMessage("下一步"),
        "pwd_format": MessageLookupByLibrary.simpleMessage(
            "为了保护您的资产，密码应包括：\\\n1个大写字母\\\n1个小写字母\\\n1个数字\\\n至少8个字符"),
        "pwd_tips": MessageLookupByLibrary.simpleMessage(
            "*密码用于加密保护私钥，转账等，所以强度非常重要。\\\n*Vtimes不存储密码，也无法帮你找回，请务必牢记。"),
        "reset_pwd": MessageLookupByLibrary.simpleMessage("再次输入密码"),
        "safe": MessageLookupByLibrary.simpleMessage("安全"),
        "safe_desc": MessageLookupByLibrary.simpleMessage("去中心化架构，底层加护，自有私钥"),
        "search_wallet": MessageLookupByLibrary.simpleMessage("搜索钱包名或公钥地址"),
        "set_name": MessageLookupByLibrary.simpleMessage("设置名称"),
        "set_pwd": MessageLookupByLibrary.simpleMessage("设置密码"),
        "test": MessageLookupByLibrary.simpleMessage("测试")
      };
}
