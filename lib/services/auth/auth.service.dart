import 'package:fairshare/services/auth/dto/login.dart';
import 'package:fairshare/services/auth/dto/register.dart';
import 'package:fairshare/services/core/api.service.dart';
import 'package:fairshare/services/core/cache.service.dart';
import 'package:fairshare/services/user/model/user.dart';
import 'package:fairshare/utils/cache.dart';

class AuthService {
  static Future<User?> getCurrentUser({bool useCache = true}) async {
    final result = await Cache.preserveJson(
      CacheService.authUserKey,
      () async => http.get("/auth/current", options: {"toast": false}).then((response) => response?["data"]),
      expiry: const Duration(minutes: 5),
      useCache: useCache,
    );
    if (result == null) return null;
    return User.fromJson(result);
  }

  static Future<LoginResponse?> login(String email, String password) async {
    final response = await http.post("/auth/login", payload: {'email': email, 'password': password});
    return response != null ? LoginResponse.fromJson(response) : null;
  }

  static Future<RegisterResponse?> register(String email, String password) async {
    final response = await http.post("/auth/register", payload: {'email': email, 'password': password});
    return response != null ? RegisterResponse.fromJson(response) : null;
  }
}
