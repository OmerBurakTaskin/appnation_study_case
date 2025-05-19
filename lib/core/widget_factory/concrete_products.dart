import 'package:app_nation_case/core/widget_factory/abstract_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialLoadingIndicator extends NativeLoadingIndicator {
  const MaterialLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}

class CupertinoLoadingIndicator extends NativeLoadingIndicator {
  const CupertinoLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator();
  }
}
