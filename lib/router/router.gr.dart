// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';

import '../page/form/page.dart';
import '../page/home/page.dart';

class Routes {
  static const String homePage = '/';
  static const String formPage = '/form-page';
  static const all = <String>{
    homePage,
    formPage,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.formPage, page: FormPage),
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
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => FormPage(),
        settings: data,
      );
    },
  };
}
