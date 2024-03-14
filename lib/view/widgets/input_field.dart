import 'package:flutter/material.dart';
import 'package:gdg_6_october_ecommerce_app/app/extensions/context.dart';

import './text_field_container.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final FormFieldValidator<String> validator;
  final Function(String) changed;
  final TextEditingController controller;

  const InputField({
    required this.changed,
    required this.validator,
    required this.hintText,
    required this.controller,
    this.icon = Icons.person,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        onChanged: changed,
        validator: validator,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: context.seedColor.primary,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
