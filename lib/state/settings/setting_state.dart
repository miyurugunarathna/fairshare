part of 'setting_bloc.dart';

enum Languages { english, sinhala, tamil }

class SettingState extends Equatable {
  String? appLanguage;

  SettingState({String? appLanguage}) {
    this.appLanguage = appLanguage ?? Languages.english.name;
  }

  SettingState copyWith({String? appLanguage}) => SettingState(
        appLanguage: appLanguage ?? this.appLanguage,
      );

  SettingState fromJson(Map<String, dynamic> json) => SettingState(
        appLanguage: json['appLanguage'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'appLanguage': appLanguage,
      };

  @override
  List get props => [appLanguage];
}
