import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule/global.dart';
import 'package:schedule/store/date.dart';
import 'package:schedule/widgets/common/modal.dart';

class WeekModal extends StatefulWidget {
  const WeekModal({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WeekModalState();
}

class _WeekModalState extends State<WeekModal> {
  int _selected = 1;

  @override
  void initState() {
    super.initState();
    _selected = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Modal(
      title: const Text('Change Week'),
      content: SizedBox(
        height: 100,
        child: CupertinoPicker(
          itemExtent: 32,
          scrollController: FixedExtentScrollController(
            initialItem: context.watch<DateProvider>().week - 1,
          ),
          onSelectedItemChanged: (int value) {
            setState(() => _selected = value + 1);
          },
          children: List.generate(
            Constants.maxWeeks,
            (index) => Center(child: Text("Week ${index + 1}")),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            await context.read<DateProvider>().setWeek(_selected);
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
