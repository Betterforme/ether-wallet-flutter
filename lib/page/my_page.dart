import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyPage extends HookWidget{
  const MyPage({super.key});
  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    return Container(
      alignment: Alignment.center,
      child: const Text('MyPage'),
    );
  }
}