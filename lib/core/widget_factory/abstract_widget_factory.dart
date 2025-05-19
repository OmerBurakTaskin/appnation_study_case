import 'package:flutter/material.dart';

// Using abstract factory pattern to access native 
// components without platform checking each time
// Comes in handy when project grows
abstract class WidgetFactory {
  Widget createLoadingIndicator();
}
