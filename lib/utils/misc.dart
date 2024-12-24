import 'dart:io';
import 'package:device_info/device_info.dart';

class DeviceInfo {
  String deviceType;
  String deviceId;
  DeviceInfo({required this.deviceType, required this.deviceId});
}

Future<DeviceInfo> getDeviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return DeviceInfo(deviceType: "Android", deviceId: androidInfo.androidId);
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return DeviceInfo(deviceType: "iOS", deviceId: iosInfo.identifierForVendor);
  }
  return DeviceInfo(deviceType: Platform.operatingSystem, deviceId: "Unknown");
}