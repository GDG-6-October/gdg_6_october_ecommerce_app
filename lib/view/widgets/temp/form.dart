import 'package:flutter/material.dart';
import 'package:gdg_6_october_ecommerce_app/app/enums/app_enums.dart';
import 'package:gdg_6_october_ecommerce_app/app/extensions/context.dart';
import 'package:gdg_6_october_ecommerce_app/app/extensions/double.dart';
import 'package:gdg_6_october_ecommerce_app/view/widgets/temp/button.dart';
import 'package:gdg_6_october_ecommerce_app/view/widgets/temp/email.dart';
import 'package:gdg_6_october_ecommerce_app/view/widgets/temp/password.dart';

class TestForm extends StatefulWidget {
  const TestForm({
    super.key,
    required this.onPressed,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    this.firstNameController,
    this.lastNameController,
    this.formLoginLabel,
    this.formSignupLabel,
    this.forgotPasswordLabel,
    this.registerNowLabel,
    this.signInNowLabel,
  });

  final VoidCallback onPressed;
  final GlobalKey<FormState> formKey;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final String? formLoginLabel;
  final String? formSignupLabel;
  final String? forgotPasswordLabel;
  final String? registerNowLabel;
  final String? signInNowLabel;

  @override
  State<TestForm> createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  var _authForm = AuthForm.login;

  void _toggleForm() => setState(
        () {
          widget.formKey.currentState!.reset();
          if (_authForm == AuthForm.login) {
            _authForm = AuthForm.signup;
          } else {
            _authForm = AuthForm.login;
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          _authForm == AuthForm.login
              ? Text(
                  widget.formLoginLabel ?? 'Login',
                  style: context.textTheme.labelLarge?.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Text(
                  widget.formSignupLabel ?? 'Sign Up',
                  style: context.textTheme.labelLarge?.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          _authForm == AuthForm.signup
              ? 10.emptyHeight
              : const SizedBox.shrink(),
          _authForm == AuthForm.signup && widget.firstNameController != null
              ? CustomInputField(
                  controller: widget.firstNameController!,
                  hintText: 'First Name',
                  validatorHint: 'Enter Your First Name',
                )
              : const SizedBox.shrink(),
          _authForm == AuthForm.signup
              ? 10.emptyHeight
              : const SizedBox.shrink(),
          _authForm == AuthForm.signup && widget.lastNameController != null
              ? CustomInputField(
                  controller: widget.lastNameController!,
                  hintText: 'Last Name',
                  validatorHint: 'Enter Your Last Name',
                )
              : const SizedBox.shrink(),
          10.emptyHeight,
          CustomInputField(
            controller: widget.emailController,
            icon: Icons.email,
          ),
          10.emptyHeight,
          CustomPasswordTextFormField(controller: widget.passwordController),
          30.emptyHeight,
          _authForm == AuthForm.login
              ? ForgotPassword(
                  label: widget.forgotPasswordLabel ?? 'Forgot password ?',
                )
              : const SizedBox.shrink(),
          const Spacer(),
          Align(
            alignment: Alignment.center,
            child: CustomButton(
              buttonLabel: _authForm == AuthForm.login
                  ? widget.formLoginLabel ?? 'Login'
                  : widget.formSignupLabel ?? 'Sign Up',
              onPressed: widget.onPressed,
              child: Text(
                _authForm == AuthForm.login
                    ? widget.formLoginLabel ?? 'Login'
                    : widget.formSignupLabel ?? 'Sign Up',
                style: context.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          20.emptyHeight,
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: _toggleForm,
              child: _authForm == AuthForm.login
                  ? Text(
                      widget.registerNowLabel ??
                          'Don\'t Have an Account ? Register Now',
                      style: context.textTheme.labelMedium?.copyWith(
                        color: context.primaryColorScheme,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      widget.signInNowLabel ?? ' Have an Account ? Sign In',
                      style: context.textTheme.labelMedium?.copyWith(
                        color: context.primaryColorScheme,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
          20.emptyHeight,
        ],
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Text(
          label,
          style: context.textTheme.labelMedium?.copyWith(
            color: context.primaryColorScheme,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
