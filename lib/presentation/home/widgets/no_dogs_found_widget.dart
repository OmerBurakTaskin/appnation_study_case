import 'package:app_nation_case/core/constants/strings/app_strings.dart';
import 'package:app_nation_case/core/constants/theme/app_colors.dart';
import 'package:app_nation_case/core/constants/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class NoDogsFoundWidget extends StatelessWidget {
  const NoDogsFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.noBreed,
          style: AppTextStyles.semiBold18,
        ),
        Text(
          AppStrings.trySomethingElse,
          style: AppTextStyles.medium16
              .copyWith(color: AppColors.textGrey.withAlpha(153)),
        )
      ],
    );
  }
}
