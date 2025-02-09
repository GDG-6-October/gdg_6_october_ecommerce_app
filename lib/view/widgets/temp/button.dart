import 'package:flutter/material.dart';
import 'package:gdg_6_october_ecommerce_app/app/extensions/context.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonLabel,
    this.onPressed,
    this.buttonLabelStyle,
    this.child,
    this.borderRadius,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.borderColor,
    this.isLoading = false,
    this.width,
    this.height,
    this.padding,
  });

  final String buttonLabel;
  final bool isLoading;
  final Widget? child;
  final VoidCallback? onPressed;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final TextStyle? buttonLabelStyle;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width * 0.8,
      height: height ?? context.height * 0.06,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? context.theme.primaryColor,
          disabledBackgroundColor:
              disabledBackgroundColor ?? context.secondaryColorScheme,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 14),
            side: BorderSide(
              color: onPressed != null && !isLoading
                  ? borderColor ?? backgroundColor ?? context.theme.primaryColor
                  : context.secondaryColorScheme,
              width: 2,
            ),
          ),
        ),
        child: isLoading
            ? const Center(
                child: SizedBox.shrink(
                    // width: 40,
                    // child: Lottie.asset(
                    //   AppLottie.loadingLottie,
                    //   repeat: true,
                    //   fit: BoxFit.cover,
                    // ),
                    ),
              )
            : child != null
                ? child!
                : Text(
                    buttonLabel,
                    style: buttonLabelStyle ??
                        context.textTheme.bodyLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: onPressed == null
                              ? Colors.grey[400]
                              : context.theme.colorScheme.onPrimary,
                        ),
                  ),
      ),
    );
  }
}
