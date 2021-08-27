import 'package:demo_note_app/services/route_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'generated/l10n.dart';

void main() {
  // ProviderScope is necassarry for riverpod to manage all dependecie injection
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Note',
      // localization stuff
      // checkout Flutter Intl vscode plugin description
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      //RouteService provides info about existing routes
      // "/" is Flutters default first page/entry page
      routes: RouteService.routes,
    );
  }
}
