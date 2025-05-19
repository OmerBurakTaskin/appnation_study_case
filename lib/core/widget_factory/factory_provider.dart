import 'dart:io';
import 'package:app_nation_case/core/widget_factory/abstract_widget_factory.dart';
import 'package:app_nation_case/core/widget_factory/concrete_widget_factory.dart';

class WidgetFactoryProvider {
  static WidgetFactory getFactory() {
    if (Platform.isIOS) {
      return CupertinoWidgetFactory();
    } else {
      return MaterialWidgetFactory();
    }
  }
}
