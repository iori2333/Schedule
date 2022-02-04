import 'package:flutter/material.dart';
import 'package:schedule/store/configs.dart';
import 'package:schedule/store/themes.dart';
import 'package:schedule/widgets/common/week_modal.dart';
import 'package:schedule/widgets/setting/theme_modal.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:provider/provider.dart';
import 'package:schedule/store/date.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SettingsList(
        platform: DevicePlatform.android,
        sections: [
          SettingsSection(
            title: const Text("System"),
            tiles: [
              SettingsTile.navigation(
                title: const Text("Theme"),
                description: const Text("Set app theme mode and primary color"),
                leading: const Icon(Icons.palette),
                onPressed: (context) {
                  showDialog(
                    context: context,
                    builder: (context) => ThemeModal(
                      context.watch<ThemeProvider>().modeIndex,
                    ),
                  );
                },
              ),
              SettingsTile.switchTile(
                initialValue: context.watch<ConfigProvider>().useNotification,
                title: const Text("Enable Notification"),
                description: const Text("Enable notifications"),
                leading: const Icon(Icons.notifications),
                onToggle: (value) {
                  context.read<ConfigProvider>().useNotification = value;
                },
              ),
            ],
          ),
          SettingsSection(
            title: const Text("Courses"),
            tiles: [
              SettingsTile.navigation(
                title: const Text("New Course"),
                description: const Text("Add a new course manually"),
                leading: const Icon(Icons.add),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                title: const Text("Import Schedule"),
                description: const Text("Import schedule from existing data"),
                leading: const Icon(Icons.upload),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                title: const Text("Manage Schedules"),
                description: const Text("Manage existing schedules"),
                leading: const Icon(Icons.table_rows),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                title: const Text("Set Week"),
                description: Text(
                  "Current week: ${context.watch<DateProvider>().week}",
                ),
                leading: const Icon(Icons.calendar_today),
                onPressed: (context) {
                  showDialog(
                    context: context,
                    builder: (context) => const WeekModal(),
                  );
                },
              ),
            ],
          ),
          SettingsSection(
            title: const Text("App"),
            tiles: [
              SettingsTile.navigation(
                title: const Text("About"),
                leading: const Icon(Icons.info),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                title: const Text("Share"),
                leading: const Icon(Icons.share),
                onPressed: (context) {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
