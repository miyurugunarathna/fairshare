import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookService {
  static Future<OAuthCredential?> login() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.success) {
      final OAuthCredential credential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );
      return credential;
    }
    return null;
  }

  static Future<void> logout() async {
    await FacebookAuth.instance.logOut();
  }
}
