import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigProvider with ChangeNotifier {
  ConfigProvider() {
    SharedPreferences.getInstance().then((value) {
      _useNotification = value.getBool("use-notification") ?? false;
    });
  }

  bool _useNotification = false;

  bool get useNotification => _useNotification;

  set useNotification(bool use) {
    _useNotification = use;
    SharedPreferences.getInstance().then((value) {
      value.setBool("use-notification", use);
    });

    notifyListeners();
  }
}
