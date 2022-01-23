import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:schedule/pages/courses.dart';
import 'package:schedule/pages/lectures.dart';
import 'package:schedule/pages/today.dart';
import 'package:schedule/router.dart';
import 'package:schedule/widgets/common/darkmode.dart';
import 'package:schedule/widgets/common/week_modal.dart';
import 'package:schedule/store/date.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final _pages = [
    const CoursePage(),
    const TodayPage(),
    const LecturePage(),
  ];

  var _current = 0;

  @override
  void initState() {
    super.initState();
    _current = 0;
  }

  @override
  Widget build(BuildContext context) {
    var week = context.watch<DateProvider>().week;

    return Scaffold(
      appBar: AppBar(
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
          const DarkModeSetter(),
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
      body: _pages[_current],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _current,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() => _current = index);
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Courses',
            icon: Icon(Icons.schedule),
          ),
          BottomNavigationBarItem(
            label: 'Today',
            icon: Icon(Icons.today),
          ),
          BottomNavigationBarItem(
            label: 'Lectures',
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
    );
  }
}
