import 'package:flutter/material.dart';
import 'package:gdg_6_october_ecommerce_app/app/extensions/context.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? iconsColor;
  final double? borderRadius;
  final String? hintText;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final FocusNode? nextRequestedFocusNode;
  final TextInputAction? textInputAction;

  const CustomPasswordTextFormField({
    this.onChanged,
    this.validator,
    required this.controller,
    this.height,
    this.width,
    this.padding,
    this.contentPadding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.iconsColor,
    this.borderRadius,
    this.hintText,
    this.hintStyle,
    this.focusNode,
    this.nextRequestedFocusNode,
    this.onEditingComplete,
    this.textInputAction,
    super.key,
  });

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool _isObscure = true;

  void _toggleObscure() => setState(() => _isObscure = !_isObscure);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? context.height * 0.065,
      width: widget.width ?? context.width * 0.9,
      margin: widget.margin ?? const EdgeInsets.symmetric(vertical: 10),
      padding: widget.padding ??
          const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
        border: Border.all(color: widget.borderColor ?? Colors.black),
      ),
      child: TextFormField(
        controller: widget.controller,
        onChanged:
            widget.onChanged ?? (password) => widget.controller.text = password,
        validator: widget.validator ??
            (value) {
              if (widget.controller.text.isEmpty ||
                  widget.controller.text == '' ||
                  widget.controller.text.length < 8) {
                return 'Password is required';
              }
              return null;
            },
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        obscureText: _isObscure,
        onEditingComplete: widget.onEditingComplete ??
            () => FocusScope.of(context).requestFocus(
                  widget.nextRequestedFocusNode,
                ),
        decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          hintText: widget.hintText ?? 'Password',
          hintStyle: widget.hintStyle,
          icon: Icon(
            Icons.lock,
            color: widget.iconsColor ?? context.primaryColorScheme,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
              color: widget.iconsColor ?? context.primaryColorScheme,
            ),
            onPressed: _toggleObscure,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
