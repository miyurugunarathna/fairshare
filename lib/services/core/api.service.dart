import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:enhanced_http/enhanced_http.dart';
import 'package:enhanced_http/interceptor.dart';
import 'package:fairshare/components/common/core/core.dart';
import 'package:fairshare/config/secrets.dart';
import 'package:fairshare/constants/keys.dart';
import 'package:fairshare/services/core/cache.service.dart';

EnhancedHttp http = EnhancedHttp(
  baseURL: Secrets.serverUrl!,
  interceptors: InterceptorOptions(
    error: (res) {
      if (res is Map<String, dynamic>) {
        if (res["data"]?["message"] != null) {
          if (res["options"]?["toast"] == false) {
            if (res["options"]?["returnError"] == true) return res["data"]["message"];
            return null;
          }
          Toast.error(res["data"]["message"]);
          if (res["options"]?["returnError"] == true) return res["data"]["message"];
        }
      } else {
        Toast.error(AppLocalizations.of(GlobalKeys.navigatorKey.currentContext!)!.justPatchingThingsUp);
      }
    },
    headers: () async {
      final String? accessToken = await CacheService.getAPIAccessToken();
      return {
        'Authorization': 'Bearer $accessToken',
      };
    },
  ),
);
