import 'package:app_nation_case/core/constants/theme/app_colors.dart';
import 'package:app_nation_case/core/constants/strings/app_strings.dart';
import 'package:app_nation_case/core/constants/theme/app_text_styles.dart';
import 'package:app_nation_case/core/extensions/widget_extensions.dart';
import 'package:app_nation_case/presentation/main/bloc/main_bloc.dart';
import 'package:app_nation_case/presentation/main/bloc/main_event.dart';
import 'package:app_nation_case/presentation/main/bloc/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final double height;

  const CustomBottomNavBar({
    super.key,
    this.height = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return SizedBox(
          height: height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomPaint(
                size: Size(MediaQuery.of(context).size.width, height),
                painter: _CustomNavBarPainter(),
              ),
              Positioned.fill(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildAppBarElement("assets/svg/bottom_bar_home.svg",
                            AppStrings.home, state.currentIndex == 0)
                        .asGestureDetector(
                            onTap: () => context
                                .read<MainBloc>()
                                .add(MainPageChangedEvent(0))),
                    VerticalDivider(
                        color: AppColors.dividerGrey,
                        thickness: 2,
                        indent: (height - 40) / 2,
                        endIndent: (height - 40) / 2),
                    _buildAppBarElement("assets/svg/bottom_bar_settings.svg",
                            AppStrings.settings, state.currentIndex == 1)
                        .asGestureDetector(
                      onTap: () =>
                          context.read<MainBloc>().add(MainPageChangedEvent(1)),
                    ),
                  ],
                ).paddingOnly(bottom: 16),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAppBarElement(String svgPath, String title, bool isActive) {
    return SizedBox(
      width: 100, // otherwise icons move when active changes
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgPath,
            color: isActive ? AppColors.primaryBlue : AppColors.black,
          ),
          Text(title,
              style: isActive
                  ? AppTextStyles.semiBold16
                      .copyWith(color: AppColors.primaryBlue)
                  : AppTextStyles.regular16)
        ],
      ),
    );
  }
}

class _CustomNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width * 0.05, 0)
      ..quadraticBezierTo(size.width * 0.08, -16, size.width * 0.15, -12)
      ..lineTo(size.width * 0.85, -12)
      ..quadraticBezierTo(size.width * 0.92, -16, size.width * 0.95, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);

    final fillPaint = Paint()..color = AppColors.paleWhite;

    canvas.drawPath(path, fillPaint);

    final borderPaint = Paint()
      ..color = AppColors.whiteBorderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
