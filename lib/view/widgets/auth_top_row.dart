import 'package:flutter/material.dart';
import 'package:gdg_6_october_ecommerce_app/app/constants/app_constants.dart';
import 'package:gdg_6_october_ecommerce_app/app/extensions/context.dart';
import 'package:gdg_6_october_ecommerce_app/app/extensions/double.dart';

class AuthTopRow extends StatelessWidget {
  const AuthTopRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 130),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppConstants.gdgLogo,
              width: 50,
            ),
            20.emptyWidth,
            Text(
              'GDG 6 October',
              style: context.textTheme.titleLarge?.copyWith(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
