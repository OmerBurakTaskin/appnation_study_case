import 'package:app_nation_case/core/constants/theme/app_colors.dart';
import 'package:app_nation_case/core/constants/strings/app_strings.dart';
import 'package:app_nation_case/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class ConnectionAlertDialog extends StatelessWidget {
  const ConnectionAlertDialog({super.key, required this.actions}); 
  final List<Widget> actions ;  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
            title: Text(AppStrings.noInternet).paddingAll(padding: 8),
            content: Image.asset(
              "assets/image/sad_dog.png",
              height: 300,
              width: 80,
            ),
            backgroundColor: AppColors.white,
            actions: actions,
          );
  }
}