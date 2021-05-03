import 'package:flutter/material.dart';

Route createRoute(Widget child) => PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final opacitiy = animation.drive(Tween(begin: 0.0, end: 1.0)
            .chain(CurveTween(curve: Curves.easeOutCirc)));
        return FadeTransition(
          opacity: opacitiy,
          child: child,
        );
      },
    );
