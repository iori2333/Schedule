import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredContainer extends StatelessWidget {
  final Widget child;

  const BlurredContainer({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: child,
      ),
    );
  }
}
