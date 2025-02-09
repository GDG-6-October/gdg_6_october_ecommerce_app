import 'package:flutter/material.dart';
import 'package:gdg_6_october_ecommerce_app/app/constants/app_constants.dart';
import 'package:gdg_6_october_ecommerce_app/services/routes/router.dart';
import 'package:gdg_6_october_ecommerce_app/services/routes/routes.dart';
import 'package:gdg_6_october_ecommerce_app/view/screens/test_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: AppConstants.greenColor),
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      // onGenerateRoute: onGenerate,
      // initialRoute: AppRoutes.auth,
      home: const TestScreen(),
    );
  }
}
