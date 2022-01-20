import 'package:flutter/material.dart';
import 'package:schedule/models/task.dart';
import 'package:schedule/widgets/today/task_modal.dart';

class TaskTile extends StatefulWidget {
  final Task task;

  const TaskTile({required this.task, Key? key}) : super(key: key);

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
      child: ListTile(
        onTap: () {
          setState(() => _isDone = !_isDone);
        },
        onLongPress: () async {
          await showDialog(
            context: context,
            builder: (context) {
              return TaskModal(
                task: widget.task,
                title: "Edit Todo",
                onSubmit: (task) {},
              );
            },
          );
        },
        leading: Checkbox(
          value: _isDone,
          onChanged: (value) {
            setState(() => _isDone = value ?? false);
          },
        ),
        title: Text(widget.task.title),
        subtitle: Text(widget.task.description),
        trailing: Text(
          "${widget.task.due.hour}:${widget.task.due.minute}",
          style: TextStyle(
            color: (DateTime.now().isBefore(widget.task.due)
                ? Colors.black
                : Colors.red),
          ),
        ),
      ),
    );
  }
}
