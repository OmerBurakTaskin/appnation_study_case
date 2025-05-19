import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get getHeight => MediaQuery.sizeOf(this).height;
  double get getWidth => MediaQuery.sizeOf(this).width;
  ThemeData get getTheme => Theme.of(this);
  EdgeInsets get getviewInsets => MediaQuery.viewInsetsOf(this);
}

