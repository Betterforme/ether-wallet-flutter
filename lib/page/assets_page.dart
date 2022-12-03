import 'package:etherwallet/ext/String.dart';
import 'package:etherwallet/service/configuration_service.dart';
import 'package:etherwallet/utils/resource_mananger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/TestSliverPersistentHeaderDelegate.dart';
import '../generated/l10n.dart';

class AssetsPage extends HookWidget {
  AssetsPage({this.callbackAction, super.key});

  VoidCallback? callbackAction;
  List tabs = ["资产", "NFT", '授权'];

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    final animationController =
        useAnimationController(duration: const Duration(seconds: 1));
    useEffect(() {
      animationController.forward();
    }, []);

    final tabController = useTabController(initialLength: 3);

    final addressStatus = useState(currentWallet.address);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset(
            ImageHelper.wrapAssetsPng('vtimes_text_black'),
            width: 92.h,
            height: 27.w,
          ),
          centerTitle: true,
          leading: IconButton(
            splashRadius: 30.w,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Image.asset(
              ImageHelper.wrapAssetsPng('assets_add'),
              width: 26.w,
              height: 26.w,
            ),
          ),
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Image.asset(
                      ImageHelper.wrapAssetsPng('scan'),
                      width: 26.w,
                      height: 26.w,
                    ),
                    Text(
                      S.of(context).vote_manager,
                      style: TextStyle(color: Colors.black, fontSize: 18.w),
                    )
                  ],
                ))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 0.w, 16.w, 0),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(height: 12.h),
                  Stack(
                    children: [
                      Image.asset(
                        ImageHelper.wrapAssetsPng('assets_top_bg'),
                        width: MediaQuery.of(context).size.width,
                        height: 144.h,
                        fit: BoxFit.fill,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(16.w, 16.w, 4.w, 0),
                            child: Row(
                              children: [
                                Text(
                                  currentWallet.name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.sp),
                                ),
                                Container(
                                  height: 20.h,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.w),
                                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(11.w),
                                  ),
                                  child: Text(
                                    'vpioneer',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18.sp),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                InkWell(
                                  child: Image.asset(
                                    ImageHelper.wrapAssetsPng(
                                        'wallet_address_switch'),
                                    width: 20.w,
                                    height: 20.w,
                                  ),
                                  onTap: () {
                                    if (addressStatus.value.startsWith('0x')) {
                                      addressStatus.value =
                                          addressStatus.value.toTronAddress();
                                    } else {
                                      addressStatus.value =
                                          addressStatus.value.toEthAddress();
                                    }
                                  },
                                ),
                                InkWell(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      ImageHelper.wrapAssetsPng('more'),
                                      width: 25.w,
                                      height: 25.w,
                                    ),
                                  ),
                                  onTap: () {},
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 12.w, horizontal: 12.w),
                            child: GestureDetector(
                              child: Row(
                                children: [
                                  Text(
                                    addressStatus.value.shortAddress(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18.sp),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Image.asset(
                                    ImageHelper.wrapAssetsPng('copy'),
                                    width: 18.w,
                                    height: 18.w,
                                  )
                                ],
                              ),
                              onTap: () {
                                addressStatus.value.copy(context);
                              },
                            ),
                          )
                        ],
                      ),
                      Positioned(
                          right: 16.w,
                          bottom: 16.w,
                          child: Image.asset(
                            ImageHelper.wrapAssetsPng('eye'),
                            width: 25.w,
                            height: 25.w,
                          ))
                    ],
                  ),
                  Container(
                    height: 90.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.w),
                            bottomRight: Radius.circular(12.w)),
                        border: Border.all(color: const Color(0x1a000000))),
                    child: Row(
                      children: [
                        Expanded(
                            child: AnimatedBuilder(
                                animation: animationController,
                                builder: (context, child) {
                                  return Container(
                                    padding: EdgeInsets.only(left: 16.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          S.of(context).quantum,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.sp),
                                        ),
                                        SizedBox(height: 8.w),
                                        ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20.0)),
                                          child: LinearProgressIndicator(
                                            color: const Color(0xffD6E0F2),
                                            backgroundColor:
                                                const Color(0xffD6E0F2),
                                            valueColor:
                                                const AlwaysStoppedAnimation<
                                                    Color>(Colors.black),
                                            value: animationController.value,
                                          ),
                                        ),
                                        SizedBox(height: 8.w),
                                        Text(
                                          '100/1000',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.sp),
                                        )
                                      ],
                                    ),
                                  );
                                })),
                        SizedBox(
                          width: 22.w,
                        ),
                        Expanded(
                            child: AnimatedBuilder(
                          animation: animationController,
                          builder: (context, child) {
                            return Container(
                              padding: EdgeInsets.only(left: 16.w, right: 16.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).entropy,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.sp),
                                  ),
                                  SizedBox(height: 8.w),
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20.0)),
                                    child: LinearProgressIndicator(
                                      color: const Color(0xffD6E0F2),
                                      backgroundColor: const Color(0xffD6E0F2),
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                              Colors.black),
                                      value: animationController.value,
                                    ),
                                  ),
                                  SizedBox(height: 8.w),
                                  Text(
                                    '100/1000',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14.sp),
                                  )
                                ],
                              ),
                            );
                          },
                        )),
                      ],
                    ),
                  ),
                ],
              ),
              DefaultTabController(
                  length: 3,
                  child: TabBar(
                    controller: tabController,
                    tabs: tabs.map((e) => Tab(text: e.toString())).toList(),
                  )),
              Expanded(
                child: TabBarView(controller: tabController, children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Text('${tabs[0]} data$index');
                    },
                    itemCount: 40,
                  ),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Text('${tabs[1]} data$index');
                    },
                    itemCount: 40,
                  ),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Text('${tabs[2]} data$index');
                    },
                    itemCount: 40,
                  )
                ]),
              )
            ],
          ),
        ));
  }
}
