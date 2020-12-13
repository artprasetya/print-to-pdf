import 'dart:ui';

import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0x80000000),
          ),
          child: Center(
            child: Container(
              height: 44,
              width: 44,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
