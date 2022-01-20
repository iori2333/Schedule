import 'package:flutter/material.dart';
import 'package:schedule/global.dart';
import 'package:schedule/models/course.dart';
import 'package:schedule/widgets/courses/tile.dart';

class CourseTileList extends StatelessWidget {
  CourseTileList({Key? key}) : super(key: key);

  static const _maxColumns = 7;
  static const _maxRows = 12;
  static const _titleHeight = 30.0;
  static const _sideWidth = 20.0;

  static final _dividers = List.generate(_maxRows, (index) => index + 1);
  static final _weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  final List<Course> _courses = [
    Course(name: "数学物理方法", place: "仙II-204", start: 3, end: 4, weekday: 1),
    Course(name: "数学物理方法", place: "仙II-204", start: 5, end: 6, weekday: 4),
    Course(name: "数字信号处理", place: "仙I-303", start: 1, end: 2, weekday: 2),
    Course(name: "摸鱼学导论", place: "仙III-404", start: 1, end: 12, weekday: 3),
  ];

  static Widget _createCourseNo(double height) {
    return Column(
      children: _dividers
          .map((element) => Container(
                width: _sideWidth,
                height: height,
                alignment: Alignment.center,
                child: Text(element.toString()),
              ))
          .toList(),
    );
  }

  static Widget _createWeekdaysTitle(double width) {
    return Row(
      children: [
        const SizedBox(width: _sideWidth),
        ..._weekDays
            .map((element) => Container(
                  width: width,
                  height: _titleHeight,
                  alignment: Alignment.center,
                  child: Text(element),
                ))
            .toList()
      ],
    );
  }

  static List<Widget> _createDividers(double fullWidth, double height) {
    return _dividers
        .map((e) => Container(
              margin: EdgeInsets.only(top: (e - 1) * height),
              width: fullWidth - _sideWidth,
              child: const Divider(
                height: 0,
                thickness: 1,
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var width = size.width / _maxColumns - _sideWidth / _maxColumns;
    var height =
        (size.height - Constants.appBarHeight - _titleHeight) / _maxRows;

    return Column(
      children: [
        _createWeekdaysTitle(width),
        Row(
          children: [
            _createCourseNo(height),
            SizedBox(
              height: size.height - Constants.appBarHeight - _titleHeight,
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    ..._createDividers(size.width, height),
                    ..._courses
                        .map((e) => CourseTile(
                              course: e,
                              width: width,
                              height: height,
                            ))
                        .toList()
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
