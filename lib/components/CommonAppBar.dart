import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar(this.context, this.myTitle, {super.key});

  final String myTitle;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
            title: Text(
              myTitle,
              style: const TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: InkWell(
              borderRadius: BorderRadius.circular(42.w),
              radius: 18.w,
              child: const Icon(Icons.arrow_back, color: Colors.black),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          toolbarHeight: 46.h,
        ),
        Container(width: MediaQuery.of(context).size.width,height: 0.1.h,color: Colors.grey,)
      ],
    );
  }

  @override
  Size get preferredSize => Size(MediaQuery.of(context).size.width, 47.1.h);
}
