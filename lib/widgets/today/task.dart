import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  final String title;
  final String description;
  final DateTime due;

  const TaskTile(
      {required this.title,
      required this.description,
      required this.due,
      Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool _isDone = false;

  @override
  void initState() {
    super.initState();
    _isDone = false;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      elevation: 4,
      child: Column(
        children: [
          ListTile(
            onTap: () {},
            minLeadingWidth: 0,
            leading: Checkbox(
              value: _isDone,
              onChanged: (value) {
                setState(() => _isDone = value ?? false);
              },
            ),
            title: Text(widget.title),
            subtitle: Text(widget.description),
            trailing: Text("${widget.due.hour}:${widget.due.minute}"),
          ),
        ],
      ),
    );
  }
}
