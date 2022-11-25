import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopSnackBar extends SnackBar {
  TopSnackBar(BuildContext context, String content, {Key? key})
      : super(
            key: key,
            content: Container(
              width: MediaQuery.of(context).size.width,
              height: 80.h,
              child: Text(
                content,
                style: TextStyle(fontSize: 20.sp),
              ),
              alignment: Alignment.centerLeft,
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.fromLTRB(
                0, 0, 0, MediaQuery.of(context).size.height - 80.h),
            backgroundColor: Colors.black,
            duration: const Duration(milliseconds: 1500));
}
