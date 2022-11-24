import 'dart:async';

import 'package:etherwallet/utils/resource_mananger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LaunchPage extends HookWidget {
  LaunchPage({super.key});

  Timer? _timer;
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _count++;
        if (_count == 2) {
          timer.cancel();
          _timer = null;
          Navigator.of(context).popAndPushNamed('/guide');
        }
      });
    }, []);

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            child: Image.asset(ImageHelper.wrapAssetsPng('logo'),
                width: 50.h, height: 50.h),
            bottom: 25.h,
          )
        ],
      ),
    );
  }
}
