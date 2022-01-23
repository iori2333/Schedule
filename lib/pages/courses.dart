import 'package:flutter/material.dart';
import 'package:schedule/widgets/courses/tile_list.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: CourseTileList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
