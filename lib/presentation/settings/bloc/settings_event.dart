part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent {}

class SettingsInitiliazeEvent extends SettingsEvent {
  SettingsInitiliazeEvent();
}
