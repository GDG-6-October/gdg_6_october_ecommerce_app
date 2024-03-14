import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  Color get primaryColor => Theme.of(this).primaryColor;

  ColorScheme get seedColor => Theme.of(this).colorScheme;

  NavigatorState get navigator {
    bool isRoot = true;
    return Navigator.of(this, rootNavigator: isRoot);
  }
}
