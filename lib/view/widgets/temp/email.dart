import 'package:flutter/material.dart';
import 'package:gdg_6_october_ecommerce_app/app/extensions/context.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final String? validatorHint;
  final Function(String)? changed;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final IconData? icon;
  final Color? iconColor;
  final double? borderRadius;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final FocusNode? nextRequestedFocusNode;

  const CustomInputField({
    required this.controller,
    this.hintText,
    this.validator,
    this.validatorHint,
    this.changed,
    this.height,
    this.width,
    this.margin,
    this.padding,
    this.backgroundColor,
    this.borderColor,
    this.icon,
    this.iconColor,
    this.borderRadius,
    this.keyboardType,
    this.focusNode,
    this.nextRequestedFocusNode,
    this.onEditingComplete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 10),
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
      width: width ?? context.width * 0.9,
      height: height ?? context.height * 0.07,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 20),
        border: Border.all(color: borderColor ?? Colors.black),
      ),
      child: TextFormField(
        controller: controller,
        onChanged: changed ?? (email) => controller.text = email,
        validator: validator ??
            (value) {
              if (controller.text.isEmpty) {
                return validatorHint ?? 'Enter Your Email';
              }
              return null;
            },
        keyboardType: keyboardType ?? TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete ??
            () => FocusScope.of(context).requestFocus(nextRequestedFocusNode),
        decoration: InputDecoration(
          icon: Icon(
            icon ?? Icons.person,
            color: iconColor ?? context.primaryColorScheme,
          ),
          hintText: hintText ?? 'Email',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
