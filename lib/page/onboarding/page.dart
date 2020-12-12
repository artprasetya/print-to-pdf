import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:print_to_pdf/page/onboarding/hook.dart';
import 'package:print_to_pdf/router/router.gr.dart';

class OnboardingPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // Funtion navigate to home page
    void navigateToHome() => ExtendedNavigator.root.popAndPush(Routes.homePage);

    // Hook
    useOnboardingHook(navigateToHome);

    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Print To PDF'),
        ),
      ),
    );
  }
}
