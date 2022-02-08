import 'dart:io';

import 'package:flutter/material.dart';
import 'package:schedule/models/course.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class CourseProvider with ChangeNotifier {
  late Database db;

  static const name = "courses";

  int _selectedSchedule = 0;

  List<String> _schedules = ["default"];

  int get selectedSchedule => _selectedSchedule;

  List<String> get schedules => _schedules;

  String get schedule => _schedules[_selectedSchedule];

  Future<void> setSchedule(int index) async {
    if (index < 0 || index >= _schedules.length) {
      return;
    }
    var prefs = await SharedPreferences.getInstance();

    _selectedSchedule = index;
    prefs.setInt("selected-schedule", index);
    notifyListeners();
  }

  Future<void> removeSchedule(int index) async {
    if (index <= 0 || index >= _schedules.length) {
      return;
    }
    var prefs = await SharedPreferences.getInstance();
    _schedules.removeAt(index);
    if (index <= _selectedSchedule) {
      setSchedule(_selectedSchedule - 1);
    }
    prefs.setStringList("schedules", _schedules);
    notifyListeners();
  }

  Future<void> addSchedule(String name) async {
    var prefs = await SharedPreferences.getInstance();
    _schedules.add(name);

    prefs.setStringList("schedules", _schedules);
    notifyListeners();
  }

  CourseProvider() {
    SharedPreferences.getInstance().then((value) {
      _selectedSchedule = value.getInt("selected-schedule") ?? 0;
      _schedules = value.getStringList("schedules") ?? ["default"];
    });
  }

  Future<CourseProvider> open() async {
    var path = await getDatabasesPath();

    db = await openDatabase(
      path + Platform.pathSeparator + name + ".db",
      singleInstance: true,
    );
    var s = """\
          CREATE TABLE IF NOT EXISTS `$schedule` (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            place TEXT,
            weeks TEXT NOT NULL,
            start TEXT NOT NULL,
            end TEXT NOT NULL,
            weekday TEXT NOT NULL
          );""";
    db.execute(s);

    return this;
  }

  Future<List<Course>> all() async {
    var courses = await db.query(schedule);
    return courses.map((course) => Course.fromMap(course)).toList();
  }

  Future<Course> insert(Course course) async {
    course.id = await db.insert(schedule, course.toMap());
    notifyListeners();
    return course;
  }

  Future<Course?> select(int id) async {
    var course = await db.query(schedule, where: 'id = ?', whereArgs: [id]);
    if (course.isNotEmpty) {
      return Course.fromMap(course.first);
    }
    return null;
  }

  Future<bool> delete(int id) async {
    var count = await db.delete(schedule, where: 'id = ?', whereArgs: [id]);
    notifyListeners();
    return count != 0;
  }

  Future<List<Course>> selectName(String courseName) async {
    var courses = await db.query(
      schedule,
      where: 'name = ?',
      whereArgs: [courseName],
    );
    return courses.map((course) => Course.fromMap(course)).toList();
  }

  Future update(Course course) async {
    if (course.id == null) {
      return;
    }
    await db.update(
      schedule,
      course.toMap(),
      where: 'id = ?',
      whereArgs: [course.id],
    );
    notifyListeners();
  }

  Future close() async => db.close();
}
