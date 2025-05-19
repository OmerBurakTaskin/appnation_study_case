import 'package:flutter/material.dart';

class SettingsItem {
  final String title;
  final String iconPath;
  final Function()? onTap;
  final Widget? trailing;

  SettingsItem({
    required this.title,
    required this.iconPath,
    this.trailing,
    this.onTap,
  });
  SettingsItem copyWith({
    String? title,
    String? iconPath,
    Widget? trailing,
    Function()? onTap,
  }) {
    return SettingsItem(
      title: title ?? this.title,
      trailing: trailing ?? this.trailing,
      iconPath: iconPath ?? this.iconPath,
      onTap: onTap ?? this.onTap,
    );
  }
}
