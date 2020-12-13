// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../page/form/page.dart';
import '../../page/home/page.dart';
import '../../page/onboarding/page.dart';
import '../../page/preference/page.dart';
import '../../page/viewer/page.dart';

class Routes {
  static const String onboardingPage = '/';
  static const String homePage = '/home-page';
  static const String formPage = '/form-page';
  static const String pdfViewerPage = '/pdf-viewer-page';
  static const String preferencePage = '/preference-page';
  static const all = <String>{
    onboardingPage,
    homePage,
    formPage,
    pdfViewerPage,
    preferencePage,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.onboardingPage, page: OnboardingPage),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.formPage, page: FormPage),
    RouteDef(Routes.pdfViewerPage, page: PdfViewerPage),
    RouteDef(Routes.preferencePage, page: PreferencePage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    OnboardingPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            OnboardingPage(),
        settings: data,
      );
    },
    HomePage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    FormPage: (data) {
      final args = data.getArgs<FormPageArguments>(
        orElse: () => FormPageArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FormPage(fileName: args.fileName),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    PdfViewerPage: (data) {
      final args = data.getArgs<PdfViewerPageArguments>(
        orElse: () => PdfViewerPageArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => PdfViewerPage(
          fileName: args.fileName,
          path: args.path,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    PreferencePage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            PreferencePage(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// FormPage arguments holder class
class FormPageArguments {
  final String fileName;
  FormPageArguments({this.fileName});
}

/// PdfViewerPage arguments holder class
class PdfViewerPageArguments {
  final String fileName;
  final String path;
  PdfViewerPageArguments({this.fileName, this.path});
}
