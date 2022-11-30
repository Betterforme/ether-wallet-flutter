import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DAppPage extends HookWidget{
  const DAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    return Container(
      alignment: Alignment.center,
      child: const Text('DApp'),
    );
  }
}