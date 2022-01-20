import 'package:flutter/material.dart';
import 'package:schedule/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DateProvider with ChangeNotifier {
  int _week = 0;

  int get week => _week;

  DateProvider() {
    SharedPreferences.getInstance().then((value) {
      _week = value.getInt("week") ?? 1;
    });
  }

  Future<void> setWeek(int week) async {
    if (week <= 0 || week > Constants.maxWeeks) {
      return;
    }

    var prefs = await SharedPreferences.getInstance();
    _week = week;
    prefs.setInt("week", week);

    notifyListeners();
  }
}
