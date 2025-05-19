import 'package:flutter/material.dart';

extension Wrappers on Widget {
  Widget asGestureDetector({Function()? onTap}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: this,
    );
  }

  Widget paddingAll({required double padding}) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  Widget paddingOnly(
      {double? right, double? left, double? top, double? bottom}) {
    return Padding(
        padding: EdgeInsets.only(
            right: right ?? 0,
            left: left ?? 0,
            bottom: bottom ?? 0,
            top: top ?? 0),
        child: this);
  }

  Widget paddingSymmetric({double? horizontal, double? vertical}) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: vertical ?? 0, horizontal: horizontal ?? 0),
        child: this);
  }

  Widget expandedIf(bool condition) {
    if (condition) return Expanded(child: this);
    return this;
  }

  Widget centeredIf(bool condition) {
    if (condition) return Center(child: this);
    return this;
  }
}
