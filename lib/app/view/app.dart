import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:physio/l10n/arb/app_localizations.dart';

import '../routing/routing.dart';

import 'package:toastification/toastification.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          textTheme: GoogleFonts.poppinsTextTheme(),
          useMaterial3: true,
        ),
      ),
    );
  }
}