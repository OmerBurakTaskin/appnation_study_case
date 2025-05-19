import 'package:app_nation_case/core/constants/theme/app_colors.dart';
import 'package:app_nation_case/core/di/di.dart';
import 'package:app_nation_case/core/routes/app_routes.dart';
import 'package:app_nation_case/presentation/home/bloc/home_bloc.dart';
import 'package:app_nation_case/presentation/main/bloc/main_bloc.dart';
import 'package:app_nation_case/presentation/settings/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(),
          ),
          BlocProvider(
            create: (context) => MainBloc(),
          ),
          BlocProvider(
            create: (context) => SettingsBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'DogSociety',
          initialRoute: AppRoutes.splash,
          navigatorKey: navigatorKey, //to overcome navigator errors
          routes: appRoutes,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "GalanoGrotesque",
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryBlue),
            useMaterial3: true,
          ),
        ));
  }
}
