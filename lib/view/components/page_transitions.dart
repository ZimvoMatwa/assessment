import 'package:flutter/material.dart';

class nordickTracks extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  nordickTracks({required this.child, this.direction = AxisDirection.left})
      : super(
          transitionDuration: Duration(milliseconds: 300),
          reverseTransitionDuration: Duration(milliseconds: 300),
          pageBuilder: (context, animation, secAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(begin: getBeginDir(), end: Offset.zero)
            .animate(animation),
        child: child,
      );

  Offset getBeginDir() {
    switch (direction) {
      case AxisDirection.up:
        return Offset(0, 1);

      case AxisDirection.down:
        return Offset(0, -1);

      case AxisDirection.right:
        return Offset(-1, 0);

      case AxisDirection.left:
        return Offset(1, 0);
    }
  }
}
