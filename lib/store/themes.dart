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
      _current = value.getInt("theme") ?? 0;
    });
  }

  var _current = 0;

  var _mode = 0;

  MaterialColor get theme => _colors[_current];

  ThemeMode get mode => _modes[_mode];

  void setColor(int index) async {
    if (index >= _colors.length) {
      return;
    }

    var _prefs = await SharedPreferences.getInstance();
    _prefs.setInt("theme", index);
    _current = index;
    notifyListeners();
  }

  void toggleMode() {
    _mode = (_mode + 1) % _modes.length;
    notifyListeners();
  }
}
