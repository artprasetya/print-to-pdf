import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:print_to_pdf/config/theme/app_theme.dart';
import 'package:print_to_pdf/global/model/pdf_data.dart';

import 'config/router/router.gr.dart';

const String pdfBoxName = 'pdf';
const String preferenceBoxName = 'preference';
const String preferenceKey = 'isDark';

Future _initBox() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PDFDataAdapter());
  await Hive.openBox<PDFData>(pdfBoxName);
}

void main() async {
  await _initBox();
  await Hive.openBox(preferenceBoxName);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(preferenceBoxName).listenable(),
      builder: (context, box, _) {
        final isDarkMode = box.get(preferenceKey, defaultValue: true);
        return MaterialApp(
          title: 'Print to PDF',
          debugShowCheckedModeBanner: false,
          theme: appThemeData[isDarkMode ? AppTheme.Dark : AppTheme.Light],
          builder: ExtendedNavigator.builder<AppRouter>(
            router: AppRouter(),
            initialRoute: Routes.onboardingPage,
          ),
        );
      },
    );
  }
}
