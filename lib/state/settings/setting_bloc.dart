import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:equatable/equatable.dart';
import 'package:fairshare/utils/cache.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  static const settingsCacheKey = "app-settings";

  SettingBloc() : super(SettingState()) {
    on<LoadSettings>((event, emit) async {
      String? result = await Cache.retrieve(settingsCacheKey);
      if (result != null) {
        emit(state.fromJson(json.decode(result)));
      }
    });
    on<SetAppLanguage>((event, emit) {
      emit(state.copyWith(appLanguage: event.language));
      Cache.save(settingsCacheKey, json.encode({...state.toJson(), "appLanguage": event.language}));
    });
    on<Reset>((event, emit) async {
      emit(SettingState());
    });
    on<FactoryReset>((event, emit) async {
      await Cache.clear();
      if (event.context.mounted) {
        Phoenix.rebirth(event.context);
      }
    });
  }
}
