import 'package:flutter/material.dart';
import 'package:schedule/models/task.dart';
import 'package:schedule/widgets/today/task.dart';
import 'package:schedule/widgets/today/task_modal.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  @override
  void initState() {
    super.initState();
  }

  final _controller = TextEditingController();

  final _tasks = [
    Task(
      title: "114514",
      description: "1919810",
      due: DateTime.now(),
    ),
    Task(
      title: "114514",
      description: "1919810",
      due: DateTime.now().add(const Duration(hours: 1)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'TODO',
              hintText: 'Search todos...',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const Divider(
            height: 0,
          ),
          ..._tasks.map((e) => TaskTile(task: e)).toList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) => TaskModal(
              title: "New Todo",
              onSubmit: (task) {},
            ),
          );
        },
      ),
    );
  }
}
