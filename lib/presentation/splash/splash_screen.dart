import 'package:app_nation_case/core/di/di.dart';
import 'package:app_nation_case/data/entities/dog_entity.dart';
import 'package:app_nation_case/data/repositories/dog_repository.dart';
import 'package:app_nation_case/presentation/home/bloc/home_bloc.dart';
import 'package:app_nation_case/presentation/main/main_view.dart';
import 'package:app_nation_case/presentation/splash/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<DogEntity>>(
      future: locator<DogRepository>().fetchDogs(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: AppIconWidget());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error loading dogs'));
        }
        if (snapshot.hasData) {
          
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _goToHome(context, snapshot.data!);
          });
        }
        return Center(child: AppIconWidget());
      },
    ));
  }

  void _goToHome(BuildContext context, List<DogEntity> dogs) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => HomeBloc()..add(HomeInitialEvent(allDogs: dogs)),
          child: MainView(),
        ),
      ),
    );
  }
}
