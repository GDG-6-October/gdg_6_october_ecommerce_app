import 'package:flutter/material.dart';
import 'package:gdg_6_october_ecommerce_app/app/constants/app_constants.dart';
import 'package:gdg_6_october_ecommerce_app/app/enums/app_enums.dart';
import 'package:gdg_6_october_ecommerce_app/app/extensions/context.dart';
import 'package:gdg_6_october_ecommerce_app/services/auth/auth_service.dart';
import 'package:gdg_6_october_ecommerce_app/services/routes/routes.dart';
import 'package:gdg_6_october_ecommerce_app/view/widgets/auth_top_row.dart';
import 'package:gdg_6_october_ecommerce_app/view/widgets/temp/form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final GlobalKey<FormState> _formKey;
  final AuthBase _authBase = Auth();
  var authForm = AuthForm.login;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.greenColor,
      body: Stack(
        children: [
          const AuthTopRow(),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 30,
                ),
                width: double.infinity,
                height: context.height * 0.75,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: TestForm(
                  formKey: _formKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  firstNameController: _firstNameController,
                  lastNameController: _lastNameController,
                  onPressed: () async {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      authForm == AuthForm.login
                          ? await _authBase.signIn(
                              _emailController.text,
                              _passwordController.text,
                            )
                          : await _authBase.signUp(
                              _emailController.text,
                              _passwordController.text,
                            );
                      context.navigator.pushNamed(AppRoutes.home);
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
