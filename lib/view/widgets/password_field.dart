import 'package:flutter/material.dart';
import 'package:gdg_6_october_ecommerce_app/app/extensions/context.dart';

import './text_field_container.dart';

class PasswordField extends StatefulWidget {
  final FormFieldValidator<String> validator;
  final Function(String) onChanged;
  final TextEditingController controller;

  const PasswordField({
    required this.onChanged,
    required this.validator,
    required this.controller,
    super.key,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscure = true;

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        validator: widget.validator,
        textInputAction: TextInputAction.done,
        obscureText: _isObscure,
        decoration: InputDecoration(
          hintText: 'Password',
          icon: Icon(
            Icons.lock,
            color: context.seedColor.primary,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
              color: context.seedColor.primary,
            ),
            onPressed: _toggleObscure,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
