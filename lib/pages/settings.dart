import 'package:flutter/material.dart';
import 'package:schedule/global.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Constants.appBarHeight,
        title: const Text("Settings"),
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('Title'),
              subtitle: Text('subtitle'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Title'),
              subtitle: Text('subtitle'),
              onTap: () {},
            ),
          ],
        ).toList(),
      ),
    );
  }
}