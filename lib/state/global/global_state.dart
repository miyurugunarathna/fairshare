part of 'global_bloc.dart';

class GlobalState extends Equatable {
  final String locale;
  final String theme;
  final String version;

  const GlobalState({this.locale = "en", this.theme = "light", this.version = "0.0.0"});

  GlobalState copyWith({String? locale, String? theme, String? version}) => GlobalState(
        locale: locale ?? this.locale,
        theme: theme ?? this.theme,
        version: version ?? this.version,
      );

  @override
  List<Object> get props => [locale, theme, version];
}
