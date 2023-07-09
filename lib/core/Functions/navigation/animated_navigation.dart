import 'package:flutter/material.dart';

class FlipPageRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  FlipPageRoute({required this.builder});

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 400);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return RotationTransition(
      turns: Tween<double>(
        begin: 0.5,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      )),
      child: child,
    );
  }
}
