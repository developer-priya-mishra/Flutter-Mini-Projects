import 'package:flutter/material.dart';

class FadeRoute<T> extends MaterialPageRoute<T> {
  FadeRoute({
    WidgetBuilder? builder,
    required RouteSettings settings,
  }) : super(
          builder: builder!,
          settings: settings,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (settings.name != null) return child;
    return FadeTransition(opacity: animation, child: child);
  }
}
