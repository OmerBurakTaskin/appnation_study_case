import 'package:app_nation_case/core/constants/theme/app_colors.dart';
import 'package:app_nation_case/core/extensions/widget_extensions.dart';
import 'package:app_nation_case/core/widget_factory/factory_provider.dart';
import 'package:app_nation_case/presentation/settings/bloc/settings_bloc.dart';
import 'package:app_nation_case/presentation/settings/widgets/settings_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc()..add(SettingsInitiliazeEvent()),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return WidgetFactoryProvider.getFactory().createLoadingIndicator();
          }
          return ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                    height: 0,
                    thickness: 2,
                    color: AppColors.lightGrey,
                  ).paddingOnly(left: 16, top: 6, bottom: 6),
              itemCount: state.settingsItems.length,
              itemBuilder: (context, index) {
                final item = state.settingsItems[index];
                return SettingsOptionWidget(
                    title: item.title,
                    iconPath: item.iconPath,
                    onTap: item.onTap,
                    trailing: item.trailing);
              });
        },
      ),
    );
  }
}
