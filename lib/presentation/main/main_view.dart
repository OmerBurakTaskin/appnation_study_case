import 'package:app_nation_case/core/constants/strings/app_strings.dart';
import 'package:app_nation_case/core/constants/theme/app_text_styles.dart';
import 'package:app_nation_case/presentation/home/home_view.dart';
import 'package:app_nation_case/presentation/main/bloc/main_bloc.dart';
import 'package:app_nation_case/presentation/main/bloc/main_state.dart';
import 'package:app_nation_case/presentation/main/widgets/custom_bottom_bar.dart';
import 'package:app_nation_case/presentation/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(AppStrings.appName, style: AppTextStyles.semiBold20),
        forceMaterialTransparency: true, // to keep color same when scrolling
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state.currentIndex == 0) {
            return HomeView();
          }
          return SettingsView();
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
