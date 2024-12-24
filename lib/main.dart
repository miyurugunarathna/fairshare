import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upgrader/upgrader.dart';
import 'package:fairshare/state/main.dart';
import 'package:fairshare/utils/utils.dart';
import 'package:fairshare/routes/routes.dart';
import 'package:fairshare/config/secrets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fairshare/constants/constants.dart';
import 'package:fairshare/state/auth/auth_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fairshare/config/themes/themes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fairshare/config/firebase_options.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:fairshare/state/global/global_bloc.dart';
import 'package:fairshare/screens/auth/login/login.dart';
import 'package:fairshare/services/auth/auth.service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fairshare/services/core/firebase/fcm.service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Secrets.appEnv == AppEnv.local.name) {
    HttpOverrides.global = AppHttpOverrides();
    await dotenv.load(fileName: ".env");
  }
  Secrets.load();
  List<Future> futures = [];
  if (DefaultFirebaseOptions.currentPlatform != null && Firebase.apps.isEmpty) {
    futures.add(Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((result) {
      return FCMService.initialize();
    }));
  }
  futures.add(AuthService.getCurrentUser());
  final futureResults = await Future.wait(futures);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.light));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp(authenticated: futureResults.last != null));
  });
}

class MyApp extends StatefulWidget {
  final bool authenticated;
  const MyApp({super.key, this.authenticated = true});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Phoenix(
      child: MultiBlocProvider(
        providers: rootBlocProviders,
        child: BlocBuilder<GlobalBloc, GlobalState>(
          builder: (context, globalState) {
            return BlocBuilder<AuthBloc, AuthState>(
              builder: (context, authState) {
                return MaterialApp(
                  builder: FToastBuilder(),
                  onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
                  debugShowCheckedModeBanner: false,
                  theme: Themes.list[globalState.theme],
                  navigatorKey: GlobalKeys.navigatorKey,
                  navigatorObservers: [routeObserver],
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  locale: Locale(globalState.locale),
                  onGenerateRoute: Routes.onGenerateRoute,
                  home: UpgradeAlert(
                    upgrader: Upgrader(dialogStyle: Platform.isIOS ? UpgradeDialogStyle.cupertino : UpgradeDialogStyle.material),
                    child: Stack(
                      children: [
                        Builder(
                          builder: (context) {
                            return const Login();
                          },
                        ),
                        Container(),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
