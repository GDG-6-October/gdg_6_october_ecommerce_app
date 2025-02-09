import 'package:flutter/material.dart';
import 'package:gdg_6_october_ecommerce_app/view/widgets/temp/form.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TestForm(
          onPressed: () {},
          formKey: formKey,
          emailController: emailController,
          passwordController: passwordController,
        ),
      ),
    );
  }
}
