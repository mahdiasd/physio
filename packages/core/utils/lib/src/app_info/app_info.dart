import 'package:package_info_plus/package_info_plus.dart';
import 'dart:io';

import 'package:utils/src/device_type/device_type.dart';

class AppInfo {
  static final AppInfo _instance = AppInfo._internal();

  AppInfo._internal();

  factory AppInfo() {
    return _instance;
  }

  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  DeviceOsType getDeviceType() {
    switch (Platform.operatingSystem) {
      case 'android':
        return DeviceOsType.Android;
      case 'ios':
        return DeviceOsType.Ios;
      case 'windows':
        return DeviceOsType.Windows;
      default:
        return DeviceOsType.Web;
    }
  }

}
