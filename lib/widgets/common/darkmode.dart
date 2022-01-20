import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:schedule/store/themes.dart';

class DarkModeSetter extends StatelessWidget {
  const DarkModeSetter({Key? key}) : super(key: key);

  static Widget _getIcon(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return const Icon(Icons.invert_colors);
      case ThemeMode.dark:
        return const Icon(Icons.nightlight_round);
      case ThemeMode.light:
        return const Icon(Icons.wb_sunny);
    }
  }

  static String _getDescription(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return 'system default';
      case ThemeMode.system:
        return 'light mode';
      case ThemeMode.light:
        return 'dark mode';
    }
  }

  @override
  Widget build(BuildContext context) {
    var mode = context.watch<ThemeProvider>().mode;
    return IconButton(
      onPressed: () {
        context.read<ThemeProvider>().toggleMode();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Switched to ${_getDescription(mode)}'),
          ),
        );
      },
      icon: _getIcon(mode),
    );
  }
}
