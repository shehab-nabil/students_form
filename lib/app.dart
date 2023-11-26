import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/student/presentation/pages/home_page.dart';
import 'generated/l10n.dart';
import 'utils/app_strings.dart';
import 'utils/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      home: const HomePage(),
    );
  }
}
