import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:print_to_pdf/page/form/page.dart';
import 'package:print_to_pdf/page/home/page.dart';
import 'package:print_to_pdf/page/onboarding/page.dart';
import 'package:print_to_pdf/page/preference/page.dart';
import 'package:print_to_pdf/page/viewer/page.dart';

const _routes = [
  CustomRoute(
    page: OnboardingPage,
    initial: true,
  ),
  CustomRoute(
    page: HomePage,
    transitionsBuilder: TransitionsBuilders.slideLeft,
  ),
  CustomRoute(
    page: FormPage,
    transitionsBuilder: TransitionsBuilders.slideLeft,
  ),
  CustomRoute(
    page: PdfViewerPage,
    transitionsBuilder: TransitionsBuilders.slideLeft,
  ),
  CustomRoute(
    page: PreferencePage,
    transitionsBuilder: TransitionsBuilders.slideLeft,
  ),
];

@MaterialAutoRouter(routes: _routes)
class $AppRouter {}
