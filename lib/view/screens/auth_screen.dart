import 'package:flutter/material.dart';
import 'package:gdg_6_october_ecommerce_app/app/constants/app_constants.dart';
import 'package:gdg_6_october_ecommerce_app/app/enums/app_enums.dart';
import 'package:gdg_6_october_ecommerce_app/app/extensions/context.dart';
import 'package:gdg_6_october_ecommerce_app/app/extensions/double.dart';
import 'package:gdg_6_october_ecommerce_app/services/auth/auth_service.dart';
import 'package:gdg_6_october_ecommerce_app/services/routes/routes.dart';
import 'package:gdg_6_october_ecommerce_app/view/widgets/auth_top_row.dart';
import 'package:gdg_6_october_ecommerce_app/view/widgets/input_field.dart';
import 'package:gdg_6_october_ecommerce_app/view/widgets/password_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;
  late final GlobalKey<FormState> _formKey;
  var _authForm = AuthForm.login;
  final AuthBase _authBase = Auth();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _authForm == AuthForm.login
                          ? Text(
                              'Login',
                              style: context.textTheme.labelLarge?.copyWith(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              'Sign Up',
                              style: context.textTheme.labelLarge?.copyWith(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      _authForm == AuthForm.signup
                          ? 30.emptyHeight
                          : const SizedBox.shrink(),
                      _authForm == AuthForm.signup
                          ? InputField(
                              controller: _nameController,
                              changed: (name) => _nameController.text = name,
                              validator: (name) {
                                if (name!.isEmpty) {
                                  return 'Enter Your Name';
                                }
                                return null;
                              },
                              hintText: 'Your Name',
                            )
                          : const SizedBox.shrink(),
                      30.emptyHeight,
                      InputField(
                        controller: _emailController,
                        changed: (email) => _emailController.text = email,
                        validator: (email) {
                          if (email!.isEmpty || !email.contains('@')) {
                            return 'Enter Valid Email';
                          }
                          return null;
                        },
                        hintText: 'Email',
                      ),
                      30.emptyHeight,
                      PasswordField(
                        controller: _passwordController,
                        onChanged: (password) =>
                            _passwordController.text = password,
                        validator: (password) {
                          if (password!.isEmpty || password.length < 8) {
                            return 'Enter Valid Password';
                          }
                          return null;
                        },
                      ),
                      30.emptyHeight,
                      _authForm == AuthForm.login
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot password ?',
                                style: context.textTheme.labelMedium?.copyWith(
                                  color: AppConstants.greenColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      30.emptyHeight,
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: context.width * 0.9,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppConstants.greenColor,
                              padding: const EdgeInsets.all(15),
                            ),
                            onPressed: () async {
                              const CircularProgressIndicator.adaptive();
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                _authForm == AuthForm.login
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
                            child: Text(
                              _authForm == AuthForm.login ? 'Login' : 'Sign Up',
                              style: context.textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () => setState(
                            () {
                              _formKey.currentState!.reset();
                              if (_authForm == AuthForm.login) {
                                _authForm = AuthForm.signup;
                              } else {
                                _authForm = AuthForm.login;
                              }
                            },
                          ),
                          child: _authForm == AuthForm.login
                              ? Text(
                                  'Don\'t Have an Account ? Register Now',
                                  style:
                                      context.textTheme.labelMedium?.copyWith(
                                    color: AppConstants.greenColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  ' Have an Account ? Sign In',
                                  style:
                                      context.textTheme.labelMedium?.copyWith(
                                    color: AppConstants.greenColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                      20.emptyHeight
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
