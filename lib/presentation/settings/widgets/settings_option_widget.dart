import 'package:app_nation_case/core/constants/theme/app_colors.dart';
import 'package:app_nation_case/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsOptionWidget extends StatelessWidget {
  const SettingsOptionWidget({
    super.key,
    required this.title,
    required this.iconPath,
    this.onTap,
    this.trailing,
  });

  final String iconPath;
  final String title;
  final Function()? onTap;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SizedBox(
        width: 40,
        child: SvgPicture.asset(
          iconPath,
          height: 32,
          width: 32,
          color: AppColors.black,
        ),
      ),
      title: Text(title),
      trailing: trailing ??
          SvgPicture.asset(
            "assets/svg/settings_direct_arrow.svg",
            height: 9.5,
            width: 9.5,
            color: AppColors.iconGrey,
          ).asGestureDetector(onTap: onTap),
    );
  }
}
