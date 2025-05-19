import 'package:app_nation_case/core/widget_factory/abstract_widget_factory.dart';
import 'package:app_nation_case/core/widget_factory/concrete_products.dart';
import 'package:flutter/material.dart';

class MaterialWidgetFactory extends WidgetFactory {
  @override
  Widget createLoadingIndicator() {
    return MaterialLoadingIndicator();
  }
}

class CupertinoWidgetFactory extends WidgetFactory {
  @override
  Widget createLoadingIndicator() {
    return CupertinoLoadingIndicator();
  }
}
