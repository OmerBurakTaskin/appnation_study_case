import 'package:app_nation_case/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.width,
      this.height,
      this.color,
      this.borderSide,
      this.borderRadius});

  final Function? onPressed;
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;
  final double? borderRadius;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed == null ? null : () => onPressed!(),
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
              side: borderSide ?? BorderSide.none,
            ),
            fixedSize: Size(width ?? context.getWidth, height ?? 48)),
        child: child);
  }
}
