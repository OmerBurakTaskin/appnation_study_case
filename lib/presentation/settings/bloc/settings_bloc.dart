import 'package:app_nation_case/core/constants/theme/app_colors.dart';
import 'package:app_nation_case/core/constants/strings/app_strings.dart';
import 'package:app_nation_case/core/helper/helper_methods.dart';
import 'package:app_nation_case/data/entities/settings_item.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState()) {
    on<SettingsInitiliazeEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));
        final osVersion = await getOsVersion();
        final items = <SettingsItem>[
          SettingsItem(
            title: AppStrings.help,
            iconPath: "assets/svg/settings_help.svg",
          ),
          SettingsItem(
            title: AppStrings.rateUs,
            iconPath: "assets/svg/settings_rate_us.svg",
          ),
          SettingsItem(
            title: AppStrings.shareWithFriends,
            iconPath: "assets/svg/settings_share.svg",
          ),
          SettingsItem(
            title: AppStrings.termsOfUse,
            iconPath: "assets/svg/settings_terms_of_use.svg",
          ),
          SettingsItem(
            title: AppStrings.privacyPolicy,
            iconPath: "assets/svg/settings_privacy_policy.svg",
          ),
          SettingsItem(
            title: AppStrings.osVersion,
            trailing: Text(
              osVersion,
              style: TextStyle(
                  color: AppColors.textGrey.withAlpha(153),
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            iconPath: "assets/svg/settings_os_version.svg",
          ),
        ];
        emit(state.copyWith(settingsItems: items, isLoading: false));
      },
    );
  }

  Future<String> getOsVersion() async {
    String osVersion = AppStrings.notKnown;
    final platform = MethodChannel("com.example.app/os_version");
    try {
      final String result = await platform.invokeMethod('getOSVersion');
      osVersion = result;
    } on PlatformException catch (e) {
      printIfDebug("Failed to get OS version: '${e.message}'.");
    }
    return osVersion;
  }
}
