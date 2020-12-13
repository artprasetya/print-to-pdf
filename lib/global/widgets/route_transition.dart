import 'package:flutter/widgets.dart';

enum Slide {
  Up,
  Down,
  Right,
  Left,
}

final slideTransition = {
  Slide.Left: Tween<Offset>(
    begin: const Offset(1, 0),
    end: Offset.zero,
  ),
  Slide.Right: Tween<Offset>(
    begin: const Offset(-1, 0),
    end: Offset.zero,
  ),
  Slide.Up: Tween<Offset>(
    begin: const Offset(0, 1),
    end: Offset.zero,
  ),
  Slide.Down: Tween<Offset>(
    begin: const Offset(0, -1),
    end: Offset.zero,
  ),
};

class RouteTransition extends PageRouteBuilder {
  final Widget page;
  final Slide slide;

  RouteTransition({
    this.page,
    this.slide = Slide.Left,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: slideTransition[slide].animate(animation),
              child: child,
            );
          },
        );
}
