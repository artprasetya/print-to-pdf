// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../page/form/page.dart';
import '../page/home/page.dart';
import '../page/viewer/page.dart';

class Routes {
  static const String homePage = '/';
  static const String formPage = '/form-page';
  static const String pdfViewerPage = '/pdf-viewer-page';
  static const all = <String>{
    homePage,
    formPage,
    pdfViewerPage,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.formPage, page: FormPage),
    RouteDef(Routes.pdfViewerPage, page: PdfViewerPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomePage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    FormPage: (data) {
      final args = data.getArgs<FormPageArguments>(
        orElse: () => FormPageArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => FormPage(
          key: args.key,
          fileName: args.fileName,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    PdfViewerPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            PdfViewerPage(),
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
  final Key key;
  final String fileName;
  FormPageArguments({this.key, this.fileName});
}
