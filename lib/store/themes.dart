import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const colors = [
    Colors.blueGrey,
    Colors.blue,
    Colors.purple,
    Colors.amber,
    Colors.green,
    Colors.deepOrange,
  ];

  static const _modes = ThemeMode.values;

  ThemeProvider() {
    SharedPreferences.getInstance().then((value) {
      _color = value.getInt("theme-color") ?? 0;
      _mode = value.getInt("theme-mode") ?? 0;
    });
  }

  var _color = 0;

  var _mode = 0;

  MaterialColor get color => colors[_color];

  ThemeMode get mode => _modes[_mode];

  int get modeIndex => _mode;

  int get colorIndex => _color;

  Future setColor(int index) async {
    if (index >= colors.length) {
      return;
    }

    var _prefs = await SharedPreferences.getInstance();
    _prefs.setInt("theme-color", index);
    _color = index;
    notifyListeners();
  }

  Future setMode(int index) async {
    if (index >= _modes.length) {
      return;
    }

    var _prefs = await SharedPreferences.getInstance();
    _prefs.setInt("theme-mode", index);
    _mode = index;
    notifyListeners();
  }

  Future toggleMode() async {
    await setMode((_mode + 1) % _modes.length);
  }
}
