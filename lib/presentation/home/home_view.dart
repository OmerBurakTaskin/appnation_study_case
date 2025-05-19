import 'package:app_nation_case/core/constants/enum/textfield_state_enum.dart';
import 'package:app_nation_case/core/constants/theme/app_text_styles.dart';
import 'package:app_nation_case/core/extensions/widget_extensions.dart';
import 'package:app_nation_case/data/entities/dog_entity.dart';
import 'package:app_nation_case/presentation/home/bloc/home_bloc.dart';
import 'package:app_nation_case/presentation/home/widgets/dog_card.dart';
import 'package:app_nation_case/presentation/home/widgets/floating_textfield.dart';
import 'package:app_nation_case/presentation/home/widgets/no_dogs_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        bool isSmall = state.textfieldState == TextfieldStateEnum.small;
        if (state.allDogs.isEmpty) {
          return const Center(
            child: Text(
              'No dogs available',
              style: AppTextStyles.medium16,
            ),
          );
        }
        return _buildDogGridView(state.filteredDogs, isSmall);
      },
    );
  }

  Widget _buildDogGridView(List<DogEntity> dogs, bool isSmall) {
    int dummyItemCount = 2; // to make last element fully visible
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: dogs.isEmpty
          ? Center(child: NoDogsFoundWidget())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
              ),
              itemCount: dogs.length + dummyItemCount,
              itemBuilder: (context, index) {
                if (index >= dogs.length) {
                  return const SizedBox();
                }
                final dog = dogs[index];
                return DogCard(
                  dog: dog,
                );
              },
            ).paddingSymmetric(horizontal: 16),
      floatingActionButton: FloatingTextfield(),
      floatingActionButtonLocation: isSmall
          ? FloatingActionButtonLocation.centerFloat
          : FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
