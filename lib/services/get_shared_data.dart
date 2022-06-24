import 'package:flutter/services.dart';

class DataClass {
  static String channel = "app.youtube";

  //get data from platform channel

  Future<String> sharedData() async {
    final String data = await MethodChannel(channel).invokeMethod("getData");
    return data;
  }
}
