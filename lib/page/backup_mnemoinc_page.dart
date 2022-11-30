import 'package:base58check/base58.dart';
import 'package:base58check/base58check.dart';
import 'package:crypto/crypto.dart';
import 'package:etherwallet/components/CommonAppBar.dart';
import 'package:etherwallet/components/TopSnackBar.dart';
import 'package:etherwallet/context/setup/wallet_setup_provider.dart';
import 'package:etherwallet/model/local_wallet.dart';
import 'package:etherwallet/page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web3dart/crypto.dart';

import '../Constants.dart';
import '../generated/l10n.dart';

class BackupMnemonicPage extends HookWidget {
  BackupMnemonicPage(this.localWallet, {super.key});

  LocalWallet localWallet;

  @override
  Widget build(BuildContext context) {
    final store = useWalletSetup(context);
    print(const Base58CheckEncoder(VISION_ALPHABET).convert(Base58CheckPayload(
        0, hexToBytes(localWallet.address.replaceAll("0x", "0x46")))));
    final gridWidth = 0.5.w;
    return Scaffold(
      appBar: CommonAppBar(context, S.of(context).backup_mnemonic),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 18.w, horizontal: 16.w),
                padding: EdgeInsets.fromLTRB(0.w, 15.w, 0.w, 0),
                child: Text(
                  S.of(context).backup_tips,
                  style: TextStyle(
                      fontSize: 18.sp, color: const Color(0xff1B1C2C)),
                ),
              ),
              Container(
                height: 4 * (MediaQuery.of(context).size.width - 36.w) / 3,
                margin: EdgeInsets.all(18.w),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey, width: gridWidth)),
                child: GridView(
                  shrinkWrap: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: gridWidth,
                      crossAxisSpacing: gridWidth,
                      crossAxisCount: 3),
                  children: localWallet.mnemonic!
                      .split(' ')
                      .map((e) => Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              e,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 26.sp),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 46.w,
                margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.w),
                child: TextButton(
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: localWallet.mnemonic));
                    ScaffoldMessenger.of(context)
                        .showSnackBar(TopSnackBar(context, 'Copy success'));
                  },
                  child: Text(
                    S.of(context).copy_mnemonic,
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    textAlign: TextAlign.center,
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.black),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.w))))),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 46.w,
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 18.w),
                child: TextButton(
                  onPressed: () {
                    localWallet.selected = true;
                    store.saveWallet(localWallet).then((value) {
                      if (value) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                            ModalRoute.withName('/main'));
                      }
                    });
                  },
                  child: Text(
                    S.of(context).already_backup,
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    textAlign: TextAlign.center,
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.black),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.w))))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
