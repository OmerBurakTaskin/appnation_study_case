import 'package:app_nation_case/core/constants/theme/app_colors.dart';
import 'package:app_nation_case/core/constants/strings/app_strings.dart';
import 'package:app_nation_case/core/constants/theme/app_text_styles.dart';
import 'package:app_nation_case/core/extensions/context_extension.dart';
import 'package:app_nation_case/core/extensions/string_extension.dart';
import 'package:app_nation_case/core/extensions/widget_extensions.dart';
import 'package:app_nation_case/core/helper/helper_methods.dart';
import 'package:app_nation_case/data/entities/dog_entity.dart';
import 'package:app_nation_case/presentation/home/widgets/random_image_dialog.dart';
import 'package:app_nation_case/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class DogDetailDialog extends StatelessWidget {
  const DogDetailDialog({super.key, required this.dog});
  final DogEntity dog;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth - 32,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: AppColors.white),
      child: Column(
        spacing: 12,
        children: [
          Expanded(
              flex: 6,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: dog.getImageProvider(), fit: BoxFit.cover)),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 32,
                    width: 32,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    child: SvgPicture.asset("assets/svg/close_icon.svg"),
                  )
                      .asGestureDetector(onTap: () => Navigator.pop(context))
                      .paddingAll(padding: 12),
                ),
              )),
          Expanded(
              flex: 5,
              child: Column(
                spacing: 12,
                children: [
                  _buildTitledElement(
                      AppStrings.breed,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 4,
                        children: [
                          SizedBox(width: 20), //to center the title
                          Text(dog.name?.capitilizeFirstLetters() ?? "Dog name",
                              style: AppTextStyles.medium16),
                          Icon(
                            Icons.search,
                            size: 20,
                          ).asGestureDetector(
                              onTap: () => _searchOnInternet(dog.name ?? ""))
                        ],
                      )),
                  _buildTitledElement(
                    AppStrings.subBreed,
                    (dog.subBreeds?.isNotEmpty ?? false)
                        ? SingleChildScrollView(
                            child: Column(
                              spacing: 4,
                              children: dog.subBreeds!
                                  .map((breed) => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        spacing: 4,
                                        children: [
                                          SizedBox(
                                              width: 20), //to center the title
                                          Text(breed.capitilizeFirstLetters(),
                                              style: AppTextStyles.medium16),
                                          Icon(
                                            Icons.search,
                                            size: 20,
                                          ).asGestureDetector(
                                              onTap: () => _searchOnInternet(
                                                  dog.name ?? ""))
                                        ],
                                      ))
                                  .toList(),
                            ),
                          )
                        : Text(AppStrings.noSubBreeds, style: AppTextStyles.medium16),
                  ),
                  Spacer(),
                  CustomButton(
                          onPressed: () => showrandomImageDialog(
                              dogBreed: dog.name!, context: context),
                          height: 56,
                          color: AppColors.buttonBlue,
                          borderRadius: 8,
                          child: Text(AppStrings.generate,
                              style: AppTextStyles.medium18
                                  .copyWith(color: AppColors.white)))
                      .paddingAll(padding: 16)
                ],
              ))
        ],
      ),
    ).paddingSymmetric(horizontal: 16, vertical: context.getHeight * 0.06);
  }

  Widget _buildTitledElement(String title, Widget child) {
    return Column(
      spacing: 8,
      children: [
        Text(title.capitilizeFirstLetters(),
            style: AppTextStyles.semiBold20
                .copyWith(color: AppColors.primaryBlue)),
        Divider(
          color: AppColors.paleWhite,
          thickness: 2,
          height: 0,
        ),
        child
      ],
    ).paddingSymmetric(horizontal: 32);
  }

  Future<void> _searchOnInternet(String breed) async {
    final String searchQuery = breed.trim().replaceAll(RegExp(r'\s+'), '+');
    final String url =
        "https://www.google.com/search?q=$searchQuery+dog+images&tbm=isch";
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      printIfDebug("Could not launch $url");
    }
  }
}

Future<void> showDogDetailDialog(DogEntity dog, BuildContext context) async {
  return showDialog(
      context: context,
      barrierColor: AppColors.black.withAlpha(80),
      builder: (context) => DogDetailDialog(dog: dog));
}
