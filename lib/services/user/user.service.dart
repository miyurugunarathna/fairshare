import 'package:fairshare/services/core/api.service.dart';
import 'package:fairshare/services/user/model/user.dart';

export "model/user.dart";

class UserService {
  static Future<User?> getUserByID(String id, {bool silent = false}) async {
    Map<String, dynamic> options = {};
    if (silent) {
      options["toast"] = false;
      options["returnError"] = true;
    }
    final response = await http.get("/users/$id", options: options);
    if (response != null) {
      if (silent && response is String) {
        throw response;
      }
      return User.fromJson(response["data"]);
    }
    return null;
  }
}
