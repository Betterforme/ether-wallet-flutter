import 'package:flutter/material.dart';
import 'generated/l10n.dart';
class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text(S.of(context).createNWallet),
              onPressed: () {
                Navigator.of(context).pushNamed('/create');
              },
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: OutlinedButton(
                child: const Text('Import wallet'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/import');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
