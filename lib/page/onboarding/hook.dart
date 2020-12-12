import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

VoidCallback useOnboardingHook(VoidCallback navigateToHome) {
  /// Function for delayed before
  /// navigate to Home Page
  ///
  _setTimer() {
    return Timer(
      Duration(seconds: 3),
      navigateToHome,
    );
  }

  /// Execute function setTimer
  useEffect(() {
    return _setTimer;
  });

  return _setTimer;
}
