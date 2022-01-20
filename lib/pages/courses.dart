import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:schedule/global.dart';
import 'package:schedule/router.dart';
import 'package:schedule/widgets/common/week_modal.dart';
import 'package:schedule/widgets/courses/tile_list.dart';
import 'package:provider/provider.dart';
import 'package:schedule/store/date.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var week = context.watch<DateProvider>().week;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Constants.appBarHeight,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Schedule"),
            InkWell(
              child: Text(
                'WEEK $week',
                textScaleFactor: 0.7,
              ),
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) => const WeekModal(),
                );
              },
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.event_note),
          ),
          IconButton(
            onPressed: () {
              AppRouter.instance.navigateTo(
                context,
                "/settings",
                transition: TransitionType.cupertino,
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CourseTileList(),
        ],
      ),
    );
  }
}
