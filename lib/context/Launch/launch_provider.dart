import 'package:etherwallet/context/Launch/launch_handler.dart';
import 'package:etherwallet/context/hook_provider.dart';
import 'package:flutter/widgets.dart';

class LaunchProvider extends ContextProviderWidget<LaunchHandler> {
  const LaunchProvider(
      {Widget? child, HookWidgetBuilder<LaunchHandler>? builder, Key? key})
      : super(child: child, builder: builder, key: key);

  @override
  Widget build(BuildContext context) {
    return provide(context, LaunchHandler());
  }

}
