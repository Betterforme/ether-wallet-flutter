import 'package:etherwallet/router.dart';
import 'package:etherwallet/service/language_service.dart';
import 'package:etherwallet/services_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'generated/l10n.dart';

Future<void> main() async {
  // bootstrapping;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final stores = await createProviders();
  runApp(MainApp(stores));
}

class MainApp extends StatelessWidget {
  const MainApp(this.stores, {Key? key}) : super(key: key);

  final List<SingleChildWidget> stores;

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(398, 745),
        builder: (context, child) => MultiProvider(
            providers: stores,
            child: Consumer<LanguageService>(
              builder: (context, languageService, child) {
                initContext(context);
                return MaterialApp(
                  title: 'Flutter App',
                  initialRoute: '/',
                  navigatorObservers: [observer],
                  onGenerateRoute: generateRoute,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  locale: Locale(languageService.getLocale()),
                  theme: ThemeData(
                    // This is the theme of your application.
                    //
                    // Try running your application with "flutter run". You'll see the
                    // application has a blue toolbar. Then, without quitting the app, try
                    // changing the primarySwatch below to Colors.green and then invoke
                    // "hot reload" (press "r" in the console where you ran "flutter run",
                    // or simply save your changes to "hot reload" in a Flutter IDE).
                    // Notice that the counter didn't reset back to zero; the application
                    // is not restarted.
                    backgroundColor: Colors.white,
                    primarySwatch: Colors.blue,
                    primaryColor: Colors.white,
                    buttonTheme: const ButtonThemeData(
                      buttonColor: Colors.blue,
                      textTheme: ButtonTextTheme.primary,
                    ),
                  ),
                );
              },
            )));
  }
}
