import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule/widgets/today/task.dart';

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
          TaskTile(
            title: "114514",
            description: "1919810",
            due: DateTime.now(),
          ),
          TaskTile(
            title: "114514",
            description: "1919810",
            due: DateTime.now(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
