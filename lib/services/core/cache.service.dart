import 'package:fairshare/utils/cache.dart';

class CacheService {
  static const String _fcmToken = "fcm-token";
  static const String _apiAccessToken = "api-access-token";
  static const String authUserKey = "auth-user";

  static Future setFCMToken(String token) {
    return Cache.save(_fcmToken, token);
  }

  static Future<String?> getFCMToken() {
    return Cache.retrieve(_fcmToken);
  }

  static Future setAPIAccessToken(String token) {
    return Cache.save(_apiAccessToken, token);
  }

  static Future<String?> getAPIAccessToken() {
    return Cache.retrieve(_apiAccessToken);
  }

  static Future setAuthUser(Map<String, dynamic> user) {
    return Cache.save(authUserKey, user);
  }
}
