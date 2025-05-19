import 'package:app_nation_case/core/constants/theme/app_colors.dart';
import 'package:app_nation_case/core/di/di.dart';
import 'package:app_nation_case/core/extensions/widget_extensions.dart';
import 'package:app_nation_case/core/widget_factory/factory_provider.dart';
import 'package:app_nation_case/data/repositories/dog_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RandomImageDialog extends StatelessWidget {
  RandomImageDialog({super.key, required this.dogBreed});
  final String dogBreed;
  final TransformationController _transformationController =
      TransformationController(Matrix4.identity());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: locator<DogRepository>().fetchRandomDogImage(dogBreed),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: WidgetFactoryProvider.getFactory()
                    .createLoadingIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading image'));
          }
          if (snapshot.hasData) {
            return Column(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  clipBehavior: Clip.hardEdge,
                  child: InteractiveViewer(
                    transformationController: _transformationController,
                    onInteractionEnd: (_) {
                      _transformationController.value = Matrix4.identity();
                    },
                    child: Image.network(
                      fit: BoxFit.cover,
                      snapshot.data!,
                      height: 256,
                      width: 256,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 32,
                  width: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(2)),
                  child: SvgPicture.asset("assets/svg/close_icon.svg"),
                ).asGestureDetector(
                  onTap: () => Navigator.pop(context),
                )
              ],
            );
          }
          return const Center(child: Text('No image found'));
        });
  }
}

Future<void> showrandomImageDialog(
    {required String dogBreed, required BuildContext context}) {
  return showDialog(
      context: context,
      barrierColor: AppColors.black.withAlpha(100),
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: RandomImageDialog(dogBreed: dogBreed),
        );
      });
}
