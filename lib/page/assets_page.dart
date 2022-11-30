import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AssetsPage extends HookWidget {
  AssetsPage({this.callbackAction, super.key});

  VoidCallback? callbackAction;

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        child: const Text('AssetsPage'),
        onPressed: callbackAction,
      ),
    );
  }
}
