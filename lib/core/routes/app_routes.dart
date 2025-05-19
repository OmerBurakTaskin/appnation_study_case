import 'package:app_nation_case/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final String splash = "/";
}

Map<String, WidgetBuilder> appRoutes = {
  AppRoutes.splash: (context) => SplashScreen(),
};

final navigatorKey = GlobalKey<NavigatorState>();
