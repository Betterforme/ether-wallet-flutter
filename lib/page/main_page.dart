import 'package:etherwallet/context/setup/wallet_setup_handler.dart';
import 'package:etherwallet/context/setup/wallet_setup_provider.dart';
import 'package:etherwallet/page/assets_page.dart';
import 'package:etherwallet/page/dapp_page.dart';
import 'package:etherwallet/page/market_page.dart';
import 'package:etherwallet/page/my_page.dart';
import 'package:etherwallet/utils/resource_mananger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/BottomNavigationBar.dart';
import '../generated/l10n.dart';
import 'drawer_page.dart';

late WalletSetupHandler mainHandler;

class MainPage extends HookWidget {
  MainPage({super.key});

  DateTime? _lastPressed;
  final iconSize = 28.w;

  @override
  Widget build(BuildContext context) {
    final selectIndex = useState(0);
    final pageControl = usePageController();
    final store = useWalletSetup(context);
    mainHandler = store;
    final pages = [
      Builder(
          builder: (context) => AssetsPage(callbackAction: () {
                Scaffold.of(context).openDrawer();
              })),
      const MarketPage(),
      const DAppPage(),
      const MyPage()
    ];

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (_lastPressed == null ||
              DateTime.now().difference(_lastPressed!) >
                  const Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressed = DateTime.now();
            return false;
          }
          return true;
        },
        child: Container(
          child: PageView.builder(
            itemBuilder: (context, index) => pages[index],
            itemCount: pages.length,
            onPageChanged: (index) {
              selectIndex.value = index;
            },
            controller: pageControl,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          VBottomNavigatorBarItem(
              'main_assets_normal', 'main_assets_select', S.of(context).assets),
          VBottomNavigatorBarItem(
              'main_market_normal', 'main_market_select', S.of(context).market),
          VBottomNavigatorBarItem(
              'main_dapp_normal', 'main_dapp_select', S.of(context).dapp),
          VBottomNavigatorBarItem(
              'main_me_normal', 'main_me_select', S.of(context).my),
        ],
        currentIndex: selectIndex.value,
        onTap: (index) {
          pageControl.jumpToPage(index);
        },
        selectedLabelStyle: TextStyle(fontSize: 14.sp, color: Colors.amber),
        unselectedLabelStyle: TextStyle(fontSize: 14.w, color: Colors.grey),
        selectedItemColor: Colors.black,
      ),
      drawer: Drawer(
        child: DrawerPage(store),
      ),
    );
  }
}
