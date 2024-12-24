import 'package:fairshare/services/user/model/user.dart';

class RegisterResponse {
  final String accessToken;
  final User user;

  const RegisterResponse({
    required this.accessToken,
    required this.user,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
        accessToken: json['data']['access_token'] ?? "",
        user: User.fromJson(json['data']['user']),
      );
}
