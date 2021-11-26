import 'package:flutter/foundation.dart';

class Log {
  static void setLog(dynamic desc, {String log = "Log ==>"}) {
    debugPrint("$log $desc");
  }
}
