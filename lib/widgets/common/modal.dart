import 'package:flutter/material.dart';
import 'package:schedule/widgets/common/blur_container.dart';

class Modal extends StatelessWidget {
  final Widget title;
  final Widget content;
  final List<Widget> actions;

  const Modal({
    required this.title,
    required this.content,
    required this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurredContainer(
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: title,
        ),
        content: content,
        actions: actions,
      ),
    );
  }
}
