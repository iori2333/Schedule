import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule/router.dart';
import 'package:schedule/store/configs.dart';
import 'package:schedule/store/date.dart';
import 'package:schedule/store/themes.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => DateProvider()),
      ChangeNotifierProvider(create: (context) => ConfigProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = context.watch<ThemeProvider>();
    return MaterialApp(
      title: 'Schedule',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: theme.color,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: theme.color,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: theme.mode,
      onGenerateRoute: AppRouter.instance.generator,
    );
  }
}
