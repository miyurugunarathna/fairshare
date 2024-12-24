import 'package:fairshare/constants/system.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Secrets {
  static String? appEnv = String.fromEnvironment("APP_ENV", defaultValue: AppEnv.local.name);

  static const _serverUrl = "SERVER_URL";
  static const _firebaseApiKey = "FIREBASE_API_KEY";
  static const _firebaseAppId = "FIREBASE_APP_ID";
  static const _firebaseMessagingSenderId = "FIREBASE_MESSAGING_SENDER_ID";
  static const _firebaseProjectId = "FIREBASE_PROJECT_ID";
  static const _firebaseIOSApiKey = "FIREBASE_IOS_API_KEY";
  static const _firebaseIOSAppId = "FIREBASE_IOS_APP_ID";
  static const _firebaseIOSClientId = "FIREBASE_IOS_CLIENT_ID";

  static String? serverUrl;
  static String? firebaseApiKey;
  static String? firebaseAppId;
  static String? firebaseMessagingSenderId;
  static String? firebaseProjectId;
  static String? firebaseIOSApiKey;
  static String? firebaseIOSAppId;
  static String? firebaseIOSClientId;

  static load() {
    serverUrl = (const bool.hasEnvironment(_serverUrl) ? const String.fromEnvironment(_serverUrl) : dotenv.env[_serverUrl])!;
    firebaseApiKey = (const bool.hasEnvironment(_firebaseApiKey) ? const String.fromEnvironment(_firebaseApiKey) : dotenv.env[_firebaseApiKey])!;
    firebaseAppId = (const bool.hasEnvironment(_firebaseAppId) ? const String.fromEnvironment(_firebaseAppId) : dotenv.env[_firebaseAppId])!;
    firebaseMessagingSenderId =
        (const bool.hasEnvironment(_firebaseMessagingSenderId) ? const String.fromEnvironment(_firebaseMessagingSenderId) : dotenv.env[_firebaseMessagingSenderId])!;
    firebaseProjectId = (const bool.hasEnvironment(_firebaseProjectId) ? const String.fromEnvironment(_firebaseProjectId) : dotenv.env[_firebaseProjectId])!;
    firebaseIOSApiKey = (const bool.hasEnvironment(_firebaseIOSApiKey) ? const String.fromEnvironment(_firebaseIOSApiKey) : dotenv.env[_firebaseIOSApiKey])!;
    firebaseIOSAppId = (const bool.hasEnvironment(_firebaseIOSAppId) ? const String.fromEnvironment(_firebaseIOSAppId) : dotenv.env[_firebaseIOSAppId])!;
    firebaseIOSClientId = (const bool.hasEnvironment(_firebaseIOSClientId) ? const String.fromEnvironment(_firebaseIOSClientId) : dotenv.env[_firebaseIOSClientId])!;
  }
}
