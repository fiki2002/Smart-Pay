import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

Future<String> getDeviceName() async {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.model;
  } else if (Platform.isIOS) {
    final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo.name;
  }
  return 'unknown';
}
