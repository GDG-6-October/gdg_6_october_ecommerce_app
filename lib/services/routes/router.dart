import 'package:flutter/material.dart';
import 'package:gdg_6_october_ecommerce_app/services/routes/routes.dart';
import 'package:gdg_6_october_ecommerce_app/view/screens/auth_screen.dart';
import 'package:gdg_6_october_ecommerce_app/view/screens/home_screen.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case AppRoutes.auth:
      return MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      );
  }
}
