import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:print_to_pdf/config/router/router.gr.dart';
import 'package:print_to_pdf/page/onboarding/hook.dart';

class OnboardingPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // Funtion navigate to home page
    void navigateToHome() => ExtendedNavigator.root.popAndPush(Routes.homePage);

    // Hook
    useOnboardingHook(navigateToHome);

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  child: CircularProgressIndicator(),
                ),
                SizedBox(height: 16),
                Text('Print To PDF'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
