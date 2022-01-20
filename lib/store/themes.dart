import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const _colors = [
    Colors.blueGrey,
    Colors.blue,
    Colors.purple,
    Colors.amber,
    Colors.green,
    Colors.lime,
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

  MaterialColor get theme => _colors[_color];

  ThemeMode get mode => _modes[_mode];

  Future setColor(int index) async {
    if (index >= _colors.length) {
      return;
    }

    var _prefs = await SharedPreferences.getInstance();
    _prefs.setInt("theme-color", index);
    _color = index;
    notifyListeners();
  }

  Future toggleMode() async {
    _mode = (_mode + 1) % _modes.length;

    var _prefs = await SharedPreferences.getInstance();
    _prefs.setInt("theme-mode", _mode);
    notifyListeners();
  }
}
