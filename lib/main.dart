import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:print_to_pdf/global/styles/app_theme.dart';
import 'package:print_to_pdf/global/theme/bloc/theme_bloc.dart';
import 'package:print_to_pdf/page/form/page.dart';
import 'package:print_to_pdf/page/home/page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          AppTheme _theme =
              state is ThemeInitial ? state.theme : AppTheme.Light;
          return MaterialApp(
            title: 'Print to PDF',
            debugShowCheckedModeBanner: false,
            theme: appThemeData[_theme],
            home: FormPage(),
          );
        },
      ),
    );
  }
}
