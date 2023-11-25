import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:task/features/student/presentation/pages/home_page.dart';
import 'package:task/generated/l10n.dart';
import 'package:task/utils/app_strings.dart';
import 'package:task/utils/app_theme.dart';
import 'package:intl/intl.dart';

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
