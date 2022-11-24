import 'package:etherwallet/components/wallet/confirm_mnemonic.dart';
import 'package:etherwallet/context/setup/wallet_setup_provider.dart';
import 'package:etherwallet/model/wallet_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/CommonAppBar.dart';
import 'components/wallet/display_mnemonic.dart';
import 'generated/l10n.dart';

class WalletCreatePage extends HookWidget {
  const WalletCreatePage(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final store = useWalletSetup(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(context, S.of(context).createNWallet),
      body: store.state.step == WalletCreateSteps.display
          ? DisplayMnemonic(
              mnemonic: store.state.mnemonic!,
              onNext: () async {
                store.goto(WalletCreateSteps.confirm);
              },
            )
          : ConfirmMnemonic(
              errors: store.state.errors?.toList(),
              onConfirm: !store.state.loading
                  ? (confirmedMnemonic) async {
                      if (await store.confirmMnemonic(confirmedMnemonic)) {
                        Navigator.of(context).popAndPushNamed('/');
                      }
                    }
                  : null,
              onGenerateNew: !store.state.loading
                  ? () async {
                      store.generateMnemonic();
                      store.goto(WalletCreateSteps.display);
                    }
                  : null,
            ),
    );
  }
}
