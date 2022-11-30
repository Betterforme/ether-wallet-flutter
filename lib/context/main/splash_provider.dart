import 'package:etherwallet/context/hook_provider.dart';
import 'package:etherwallet/context/main/splash_handler.dart';
import 'package:flutter/widgets.dart';

class MainProvider extends ContextProviderWidget<MainHandler> {
  const MainProvider(
      {Widget? child, HookWidgetBuilder<MainHandler>? builder, Key? key})
      : super(child: child, builder: builder, key: key);

  @override
  Widget build(BuildContext context) {
    return provide(context, MainHandler());
  }

}
