part of 'global_bloc.dart';

abstract class GlobalEvent {
  const GlobalEvent();
}

class SetLocale extends GlobalEvent {
  final String locale;
  const SetLocale(this.locale);
}

class SetTheme extends GlobalEvent {
  final String theme;
  const SetTheme(this.theme);
}

class SetVersion extends GlobalEvent {
  final String version;
  const SetVersion(this.version);
}

class Reset extends GlobalEvent {}