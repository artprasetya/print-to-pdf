import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:print_to_pdf/global/model/pdf_data.dart';
import 'package:print_to_pdf/global/styles/app_theme.dart';
import 'package:print_to_pdf/router/router.gr.dart';

const String pdfBoxName = 'pdf';

Future _initBox() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PDFDataAdapter());
  await Hive.openBox<PDFData>(pdfBoxName);
}

void main() async {
  await _initBox();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Print to PDF',
      debugShowCheckedModeBanner: false,
      theme: appThemeData[AppTheme.Dark],
      builder: ExtendedNavigator.builder<AppRouter>(
        router: AppRouter(),
        initialRoute: Routes.onboardingPage,
      ),
    );
  }
}
