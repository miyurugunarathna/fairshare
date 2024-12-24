import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/single_child_widget.dart';
import 'package:fairshare/state/auth/auth_bloc.dart' as auth;
import 'package:fairshare/state/global/global_bloc.dart';
import 'package:fairshare/state/settings/setting_bloc.dart';

List<SingleChildWidget> rootBlocProviders = [
  BlocProvider(create: (context) {
    final bloc = GlobalBloc();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) => bloc.add(SetVersion(packageInfo.version)));
    return bloc;
  }),
  BlocProvider(create: (context) => SettingBloc()..add(LoadSettings())),
  BlocProvider(create: (context) => auth.AuthBloc()..add(auth.RefreshUser(context))),
];

void resetStates(BuildContext context) {
  context.read<auth.AuthBloc>().add(auth.Reset());
}
