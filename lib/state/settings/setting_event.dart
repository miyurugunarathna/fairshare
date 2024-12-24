part of 'setting_bloc.dart';

abstract class SettingEvent {
  const SettingEvent();
}

class LoadSettings extends SettingEvent {}

class SetAppLanguage extends SettingEvent {
  final String language;
  const SetAppLanguage(this.language);
}

class FactoryReset extends SettingEvent {
  BuildContext context;
  FactoryReset(this.context);
}

class Reset extends SettingEvent {}
