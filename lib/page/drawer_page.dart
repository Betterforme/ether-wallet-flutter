import 'package:etherwallet/ext/String.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../context/setup/wallet_setup_handler.dart';
import '../generated/l10n.dart';
import '../utils/resource_mananger.dart';

class DrawerPage extends HookWidget {
  const DrawerPage(this.handler, {super.key});

  final WalletSetupHandler handler;

  @override
  Widget build(BuildContext context) {
    final wallets = useState(handler.getWallet());

    final searchController = useTextEditingController();
    final deleteVisible = useState(false);
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
      color: const Color(0xff1B1C2C),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageHelper.wrapAssetsPng('vtimes_text'),
                  width: 75.w,
                  height: 27.w,
                ),
                const Expanded(child: SizedBox()),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(15.w))),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageHelper.wrapAssetsPng('add'),
                          width: 12.w,
                          height: 12.w,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          S.of(context).add_wallet,
                          style: TextStyle(color: Colors.white, fontSize: 15.w),
                        )
                      ],
                    ),
                  ),
                  onTap: () {},
                )
              ],
            ),
          ),
          Container(
            height: 35.h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
                color: const Color(0xff313242),
                borderRadius: BorderRadius.all(Radius.circular(7.w))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: TextField(
                  cursorHeight: 16.h,
                  controller: searchController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: -16.w),
                    icon: Padding(
                      padding: EdgeInsets.fromLTRB(16.w, 0, 0, 0),
                      child: Image.asset(
                        ImageHelper.wrapAssetsPng('search'),
                        width: 16.w,
                        height: 16.w,
                      ),
                    ),
                    hintText: S.of(context).search_wallet,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        fontSize: 16.sp, color: const Color(0xffB8BDC8)),
                  ),
                  onChanged: (text) {
                    deleteVisible.value = text.isNotEmpty;
                    if (text.isEmpty) {
                      wallets.value = handler.getWallet();
                    } else {
                      final filterWallet = handler
                          .getWallet()
                          .where((element) =>
                              element.name.toLowerCase().contains(text.toLowerCase()) ||
                              element.address.toLowerCase().contains(text.toLowerCase()))
                          .toList();

                      wallets.value = filterWallet;
                    }
                  },
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                )),
                if (searchController.text.isNotEmpty)
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Image.asset(
                        ImageHelper.wrapAssetsPng('search_delete'),
                        width: 16.w,
                        height: 16.w,
                      ),
                    ),
                    onTap: () {
                      searchController.text = '';
                      deleteVisible.value = false;
                    },
                  ),
              ],
            ),
          ),
          Expanded(
              child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: GestureDetector(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(16.w, 12.w, 16.w, 0),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xff474C58), Color(0xff222733)]),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(12.w))),
                      height: 80.w,
                      padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 0),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                wallets.value[index].name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5.w),
                              Text(
                                wallets.value[index].address
                                    .toTronAddress()
                                    .shortAddress(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.sp),
                              )
                            ],
                          ),
                          Positioned(
                            child: wallets.value[index].selected == true
                                ? Image.asset(
                                    ImageHelper.wrapAssetsPng('item_select_yes'),
                                    width: 18.w,
                                    height: 18.w,
                                  )
                                : Image.asset(
                                    ImageHelper.wrapAssetsPng('item_select_no'),
                                    width: 18.w,
                                    height: 18.w,
                                  ),
                            right: 6.w,
                            top: 10.w,
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: wallets.value.length,
              ),
              onTap: (){
                Scaffold.of(context).closeDrawer();
              },
            ),
          ))
        ],
      ),
    ));
  }
}
