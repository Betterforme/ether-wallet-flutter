import 'package:etherwallet/components/wallet/confirm_mnemonic.dart';
import 'package:etherwallet/context/setup/wallet_setup_provider.dart';
import 'package:etherwallet/model/local_wallet.dart';
import 'package:etherwallet/model/wallet_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web3dart/web3dart.dart';

import 'components/CommonAppBar.dart';
import 'components/TopSnackBar.dart';
import 'components/wallet/display_mnemonic.dart';
import 'generated/l10n.dart';

class WalletCreatePage extends HookWidget {
  WalletCreatePage(this.title, {Key? key}) : super(key: key);

  final String title;

  final nameControl = useTextEditingController();
  final pwdControl = useTextEditingController();
  final pwdAgainControl = useTextEditingController();
  final nextState = useState(false);

  @override
  Widget build(BuildContext context) {
    final store = useWalletSetup(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(context, S.of(context).createNWallet),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).set_name,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(width: 0, height: 10.w),
              Text(S.of(context).name_used_to,
                  style: TextStyle(
                      fontSize: 14.sp, color: const Color(0xffB8BDC8))),
              SizedBox(width: 0, height: 20.w),
              TextField(
                controller: nameControl,
                maxLength: 14,
                onChanged: (text) {
                  nextState.value = checkData();
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: S.of(context).char_number,
                    hintStyle: TextStyle(
                        color: const Color(0xffB8BDC8), fontSize: 18.sp),
                    counterText: ''),
                style: TextStyle(color: Colors.black, fontSize: 18.sp),
                cursorHeight: 19.w,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: const Color(0xffF2F2F2),
              ),
              SizedBox(width: 0, height: 20.w),
              Text(S.of(context).set_pwd,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(width: 0, height: 10.w),
              Text(S.of(context).pwd_tips,
                  style: TextStyle(
                      fontSize: 14.sp, color: const Color(0xffB8BDC8))),
              SizedBox(width: 0, height: 20.w),
              TextField(
                obscureText: true,
                controller: pwdControl,
                maxLength: 14,
                onChanged: (_) {
                  nextState.value = checkData();
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: S.of(context).set_pwd,
                    hintStyle: TextStyle(
                        color: const Color(0xffB8BDC8), fontSize: 18.sp),
                    counterText: ''),
                style: TextStyle(color: Colors.black, fontSize: 18.sp),
                cursorHeight: 19.w,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: const Color(0xffF2F2F2),
              ),
              SizedBox(width: 0, height: 15.w),
              TextField(
                obscureText: true,
                controller: pwdAgainControl,
                maxLength: 14,
                onChanged: (_) {
                  nextState.value = checkData();
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: S.of(context).reset_pwd,
                    hintStyle: TextStyle(
                        color: const Color(0xffB8BDC8), fontSize: 18.sp),
                    counterText: ''),
                style: TextStyle(color: Colors.black, fontSize: 18.sp),
                cursorHeight: 19.w,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: const Color(0xffF2F2F2),
              ),
              SizedBox(width: 0.w, height: 56.w),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 44.h,
                child: TextButton(
                  onPressed: nextState.value
                      ? () {
                          if (pwdControl.text.length < 8) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(TopSnackBar(context, '密码长度小于8位'));
                          } else if (pwdControl.text == pwdAgainControl.text) {
                            store.generateWalletByMnemonic(store.generateMnemonic(),nameControl.text,pwdAgainControl.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                                TopSnackBar(
                                    context, store.state.mnemonic ?? ''));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(TopSnackBar(context, '两次密码不一致'));
                          }
                        }
                      : null,
                  child: Text(
                    S.of(context).next,
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(nextState.value
                          ? const Color(0xff1B1C2C)
                          : const Color(0xffcccccc)),
                      shape: const MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool checkData() {
    bool ret = true;
    if (nameControl.text.isEmpty ||
        pwdAgainControl.text.isEmpty ||
        pwdControl.text.isEmpty) {
      ret = false;
    }
    return ret;
  }
}
