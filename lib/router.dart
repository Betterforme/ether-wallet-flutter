import 'package:etherwallet/context/Launch/launch_provider.dart';
import 'package:etherwallet/context/splash/splash_provider.dart';
import 'package:etherwallet/model/network_type.dart';
import 'package:etherwallet/page_route_anim.dart';
import 'package:etherwallet/qrcode_reader_page.dart';
import 'package:etherwallet/service/configuration_service.dart';
import 'package:etherwallet/splash_page.dart';
import 'package:etherwallet/utils/route_utils.dart';
import 'package:etherwallet/wallet_create_page.dart';
import 'package:etherwallet/wallet_import_page.dart';
import 'package:etherwallet/wallet_main_page.dart';
import 'package:etherwallet/wallet_transfer_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import 'context/Launch/launch_page.dart';
import 'context/setup/wallet_setup_provider.dart';
import 'context/transfer/wallet_transfer_provider.dart';
import 'context/wallet/wallet_provider.dart';
import 'intro_page.dart';

late BuildContext _context;

void initContext(BuildContext context) {
  _context = context;
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      final configurationService = Provider.of<ConfigurationService>(_context);
      if (configurationService.didSetupWallet())
        return CupertinoPageRoute(
            builder: (_) => WalletProvider(
                builder: (context, store) => const WalletMainPage('Your wallet')));

      return CupertinoPageRoute(
          builder: (_) => LaunchProvider(
                builder: (context, store) => LaunchPage(),
              ));
    case '/create':
      return CupertinoPageRoute(
          builder: (_) => WalletSetupProvider(builder: (context, store) {
                useEffect(() {
                  store.generateMnemonic();
                }, []);
                return const WalletCreatePage('Create wallet');
              }));
    case '/import':
      return CupertinoPageRoute(
          builder: (_) => WalletSetupProvider(
                builder: (context, store) =>
                    const WalletImportPage('Import wallet'),
              ));
    case '/transfer':
      return CupertinoPageRoute(
          builder: (_) => WalletTransferProvider(
                builder: (context, store) => WalletTransferPage(
                  title: 'Send Tokens',
                  network: getRouteArgs<NetworkType>(context),
                ),
              ));
    case '/qrcode_reader':
      return FadeRouteBuilder(QRCodeReaderPage(
        title: 'Scan QRCode',
        onScanned: ModalRoute.of(_context)?.settings.arguments as OnScanned?,
      ));
    case '/guide':
      return CupertinoPageRoute(
          builder: (_) => LaunchProvider(
                builder: (context, store) => SplashPage(),
              ));
    default:
      return SlideTopRouteBuilder(
          WalletSetupProvider(builder: (context, store) {
        useEffect(() {
          store.generateMnemonic();
        }, []);
        return const WalletCreatePage('Create wallet');
      }));
  }
}
