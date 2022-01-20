import 'package:flutter/material.dart';
import 'package:schedule/models/course.dart';

class CourseTile extends StatelessWidget {
  final Course course;
  final double width;
  final double height;

  const CourseTile(
      {required this.course,
      required this.width,
      required this.height,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * (course.end - course.start + 1),
      width: width,
      margin: EdgeInsets.only(
        top: (course.start - 1) * height,
        left: (course.weekday - 1) * width,
      ),
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: course.isActive
              ? Colors.amber.withOpacity(0.8)
              : Colors.lime.withOpacity(0.8),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        padding: const EdgeInsets.all(2.5),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Text(
            (course.isActive ? "" : "[非本周]\n") + course.toString(),
            textScaleFactor: 0.9,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
