import "package:flutter/material.dart";

import "package:minimis/ui/index.dart" as ui;

final class Router {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext? get currentContext => navigatorKey.currentContext;

  static MaterialPageRoute<void> onGenerateRoute(RouteSettings settings) {
    if (settings.name == ui.Home.pageName) return _getRoute(const ui.Home());
    if (settings.name == ui.Aircraft.pageName) return _getRoute(const ui.Aircraft());

    return _getRoute(const Scaffold(body: Placeholder()));
  }

  static MaterialPageRoute<void> _getRoute(Widget widget) {
    return MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    );
  }
}
