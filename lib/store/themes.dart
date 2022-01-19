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

  ThemeProvider() {
    SharedPreferences.getInstance().then((value) {
      _current = value.getInt("theme") ?? 0;
    });
  }

  var _current = 0;

  MaterialColor get theme => _colors[_current];

  void setColor(int index) async {
    if (index >= _colors.length) {
      return;
    }

    var _prefs = await SharedPreferences.getInstance();
    _prefs.setInt("theme", index);
    _current = index;
    notifyListeners();
  }
}
