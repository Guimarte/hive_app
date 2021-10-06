import 'package:hive_flutter/hive_flutter.dart';

Future<void> hiveSetConfig(String host, String api) async {
  var box = await Hive.openBox("appConfig");
  box.put("config", {"host": host, "api": api});
}

Future<Map> hiveGetConfig() async {
  var box = await Hive.openBox("appConfig");
  return box.get("config");
}
