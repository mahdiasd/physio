import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';

extension Logger on Object {
  void dLog({String key = 'MyLog', String plusKey = ''}) {
    final logHeader = '🔹[$key${plusKey.isNotEmpty ? ' - $plusKey' : ''}]';
    if (kDebugMode) {
      dev.log(
        this.toString(),
        name: logHeader,
      );
    }
  }
}
