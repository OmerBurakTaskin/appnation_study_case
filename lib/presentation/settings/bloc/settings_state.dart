part of 'settings_bloc.dart';

class SettingsState {
  final List<SettingsItem> settingsItems;
  final bool isLoading;
  final bool isError;

  SettingsState({
    this.settingsItems = const [],
    this.isLoading = false,
    this.isError = false,
  });

  SettingsState copyWith({
    List<SettingsItem>? settingsItems,
    bool? isLoading,
    bool? isError,
  }) {
    return SettingsState(
      settingsItems: settingsItems ?? this.settingsItems,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
    );
  }
}
