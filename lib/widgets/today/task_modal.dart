import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule/models/task.dart';
import 'package:schedule/widgets/common/modal.dart';

class TaskModal extends StatefulWidget {
  final String title;
  final void Function(Task) onSubmit;
  final Task? task;

  const TaskModal({
    required this.title,
    required this.onSubmit,
    this.task,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskModalState();
}

class _TaskModalState extends State<TaskModal> {
  final _nameController = TextEditingController();

  final _descriptionController = TextEditingController();

  late DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Modal(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            maxLines: 1,
            controller: _nameController..text = widget.task?.title ?? "",
            decoration: const InputDecoration(
              icon: Icon(Icons.task),
              hintText: "Title",
            ),
          ),
          TextField(
            maxLines: null,
            controller: _descriptionController
              ..text = widget.task?.description ?? "",
            decoration: const InputDecoration(
              icon: Icon(Icons.description),
              hintText: "Description",
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 120,
            child: CupertinoDatePicker(
              initialDateTime: widget.task?.due,
              mode: CupertinoDatePickerMode.time,
              onDateTimeChanged: (value) {
                setState(() => _dateTime = value);
              },
            ),
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            if (_nameController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Failed: Name shouldn't be empty"),
              ));
            } else {
              widget.onSubmit(Task(
                title: _nameController.text,
                description: _descriptionController.text,
                due: _dateTime,
              ));
            }
            Navigator.of(context).pop();
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
