import 'package:fairshare/services/user/model/user.dart';

class LoginResponse {
  final String accessToken;
  final String refreshToken;
  final User user;

  const LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        accessToken: json['access_token'] ?? "",
        refreshToken: json['refresh_token'] ?? "",
        user: User.fromJson(json['user'] ?? json['data']),
      );
}
