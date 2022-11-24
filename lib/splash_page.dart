import 'dart:async';

import 'package:etherwallet/utils/resource_mananger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'generated/l10n.dart';

class SplashPage extends HookWidget {
  SplashPage({super.key});

  final List _pageItem = [
    {
      'icon': ImageHelper.wrapAssetsPng('guide_01'),
      'title': S.current.ecological,
      'desc': S.current.ecological_desc
    },
    {
      'icon': ImageHelper.wrapAssetsPng('guide_02'),
      'title': S.current.safe,
      'desc': S.current.safe_desc
    },
    {
      'icon': ImageHelper.wrapAssetsPng('guide_03'),
      'title': S.current.mul_chain,
      'desc': S.current.mul_chain_desc
    }
  ];

  final PageController _controller = PageController();
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Timer.periodic(const Duration(seconds: 2), (timer) {
        _page++;
        _controller.animateToPage(_page,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut);
      });
    }, []);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 80.h, 0, 0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: PageView.builder(
                    itemBuilder: (context, index) {
                      final int pos = index % 3;
                      return PageItem(
                          _pageItem[pos]['icon'] as String,
                          _pageItem[pos]['title'] as String,
                          _pageItem[pos]['desc'] as String);
                    },
                    itemCount: 100000,
                    controller: _controller,
                  )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(ImageHelper.wrapAssetsPng('guide_bottom')),
            ),
            Align(
              alignment: const Alignment(0.0, 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 150.w,
                    height: 50.h,
                    child: TextButton(
                      onPressed: () {
                          Navigator.of(context).pushNamed('/create');
                      },
                      child: Text(
                        S.of(context).createNWallet,
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))))),
                    ),
                  ),
                  SizedBox(
                    width: 150.w,
                    height: 50.h,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/import');
                      },
                      child: Text(
                        S.of(context).import_wallet,
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                      style: const ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.white,
                                      style: BorderStyle.solid),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))))),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 0.25),
              child: SmoothPageIndicator(
                controller: _controller,
                count: _pageItem.length,
                effect: WormEffect(
                    dotHeight: 8.w,
                    dotWidth: 8.w,
                    type: WormType.thin,
                    activeDotColor: const Color(0xff1B1C2C),
                    dotColor: const Color(0xffB8BDC8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageItem extends HookWidget {
  PageItem(this.icon, this.desTitle, this.desDetail, {super.key});

  String icon;
  String desTitle;
  String desDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          icon,
          width: 310.w,
          height: 240.h,
        ),
        SizedBox(height: 24.h),
        Text(desTitle,
            style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            desDetail,
            style: TextStyle(fontSize: 22.sp, color: const Color(0xff1B1C2C)),
          ),
        )
      ],
    );
  }
}
