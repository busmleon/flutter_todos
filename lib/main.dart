import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/dependency.injector.dart' as injector;
import 'core/localizator.dart';
import 'core/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await injector.init();
  if (Platform.isIOS || Platform.isMacOS) {
    runApp(const MyCupertinoApp());
  } else {
    runApp(const MyMaterialApp());
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos-List',
      onGenerateRoute: MyRouter.generateMaterialRoute,
      initialRoute: '/',
      supportedLocales: const [
        Locale('en'),
        Locale('de'),
      ],
      localizationsDelegates: const [
        Localizator.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale != null) {
          for (Locale supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode)
              return locale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp();
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Todos-List',
      onGenerateRoute: MyRouter.generateCupertinoRoute,
      initialRoute: '/',
      supportedLocales: const [
        Locale('en'),
        Locale('de'),
      ],
      localizationsDelegates: const [
        Localizator.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale != null) {
          for (Locale supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode)
              return locale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
