import 'package:auto_route/auto_route_annotations.dart';
import 'package:print_to_pdf/page/form/page.dart';
import 'package:print_to_pdf/page/home/page.dart';

const _routes = [
  AdaptiveRoute(page: HomePage, initial: true),
  AdaptiveRoute(page: FormPage)
];

@MaterialAutoRouter(routes: _routes)
class $AppRouter {}
