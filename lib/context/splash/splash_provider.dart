import 'package:etherwallet/context/hook_provider.dart';
import 'package:etherwallet/context/splash/splash_handler.dart';
import 'package:flutter/widgets.dart';

class SplashProvider extends ContextProviderWidget<SplashHandler> {
  const SplashProvider(
      {Widget? child, HookWidgetBuilder<SplashHandler>? builder, Key? key})
      : super(child: child, builder: builder, key: key);

  @override
  Widget build(BuildContext context) {
    return provide(context, SplashHandler());
  }

}
