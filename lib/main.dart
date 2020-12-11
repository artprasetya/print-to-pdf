import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:print_to_pdf/global/styles/app_theme.dart';
import 'package:print_to_pdf/router/router.gr.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Print to PDF',
      debugShowCheckedModeBanner: false,
      theme: appThemeData[AppTheme.Dark],
      builder: ExtendedNavigator.builder<AppRouter>(
        router: AppRouter(),
        initialRoute: Routes.homePage,
      ),
    );
  }
}
