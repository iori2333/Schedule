import 'package:flutter/material.dart';
import 'package:schedule/models/course.dart';
import 'package:schedule/widgets/common/blur_container.dart';

class CourseTile extends StatelessWidget {
  final Course course;
  final double width;
  final double height;

  const CourseTile({
    required this.course,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

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
      child: InkWell(
        onTap: () {},
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: BlurredContainer(
          child: Container(
            decoration: BoxDecoration(
              color: course.isActive
                  ? Colors.amber.withOpacity(0.6)
                  : Colors.lime.withOpacity(0.6),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            padding: const EdgeInsets.all(2.5),
            child: Text(
              (course.isActive ? "" : "[Skipped]\n") + course.toString(),
              textScaleFactor: 0.9,
            ),
          ),
        ),
      ),
    );
  }
}
