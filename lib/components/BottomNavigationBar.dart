import 'package:etherwallet/utils/resource_mananger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VBottomNavigatorBarItem extends BottomNavigationBarItem {
  VBottomNavigatorBarItem(String icon, String activeIcon, String label)
      : super(
            icon: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 2.w),
              child: Image.asset(
                ImageHelper.wrapAssetsPng(icon),
                width: 28.w,
                height: 28.w,
              ),
            ),
            activeIcon: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 2.w),
              child: Image.asset(
                ImageHelper.wrapAssetsPng(activeIcon),
                width: 28.w,
                height: 28.w,
              ),
            ),
            label: label);
}
