import 'package:flutter/material.dart';
import 'package:schedule/db/courses.dart';
import 'package:schedule/models/course.dart';
import 'package:schedule/widgets/courses/tile.dart';
import 'package:provider/provider.dart';

class CourseTileList extends StatelessWidget {
  const CourseTileList({Key? key}) : super(key: key);

  static const _maxColumns = 7;
  static const _maxRows = 12;
  static const _titleHeight = 30.0;
  static const _sideWidth = 20.0;

  static final _dividers = List.generate(_maxRows, (index) => index + 1);
  static final _weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

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
    var provider = context.watch<CourseProvider>();

    var width = size.width / _maxColumns - _sideWidth / _maxColumns;
    var fullHeight = size.height -
        kToolbarHeight -
        kBottomNavigationBarHeight -
        _titleHeight;
    var height = fullHeight / _maxRows;

    return FutureBuilder<List<Course>>(
      future: provider.open().then((value) => value.all()),
      builder: (context, snapshot) {
        return Column(
          children: [
            _createWeekdaysTitle(width),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _createCourseNo(height),
                SizedBox(
                  // height: fullHeight,
                  child: Stack(
                    children: [
                      ..._createDividers(size.width, height),
                      ...(snapshot.data ?? [])
                          .map((e) => CourseTile(
                                course: e,
                                width: width,
                                height: height,
                              ))
                          .toList()
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
