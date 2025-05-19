import 'package:flutter/material.dart';

class AppIconWidget extends StatelessWidget {
  const AppIconWidget({super.key, this.size = 64});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/image/app_icon.png",
      height: size,
      width: size,
    );
  }
}
