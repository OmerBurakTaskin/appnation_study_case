import 'dart:ui';

import 'package:app_nation_case/core/constants/theme/app_colors.dart';
import 'package:app_nation_case/core/constants/theme/app_text_styles.dart';
import 'package:app_nation_case/core/extensions/context_extension.dart';
import 'package:app_nation_case/core/extensions/string_extension.dart';
import 'package:app_nation_case/core/extensions/widget_extensions.dart';
import 'package:app_nation_case/data/entities/dog_entity.dart';
import 'package:app_nation_case/presentation/home/widgets/dog_detail_dialog.dart';
import 'package:flutter/material.dart';

class DogCard extends StatelessWidget {
  const DogCard({super.key, required this.dog});
  final DogEntity dog;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white,
            border: Border.all(color: AppColors.whiteBorderColor, width: 1),
            image: DecorationImage(
                image: dog.getImageProvider(), fit: BoxFit.cover)),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), bottomLeft: Radius.circular(8)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: IntrinsicWidth(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                height: context.getHeight * 0.04,
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(60),
                ),
                child: Center(
                    child: Text(dog.name!.capitilizeFirstLetters(),
                        style: AppTextStyles.medium16
                            .copyWith(color: AppColors.white))),
              ),
            ),
          ),
        )).asGestureDetector(
      onTap: () => showDogDetailDialog(dog, context),
    );
  }
}
