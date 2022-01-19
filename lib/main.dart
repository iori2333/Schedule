import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule/router.dart';
import 'package:schedule/store/themes.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: context.watch<ThemeProvider>().theme,
      ),
      onGenerateRoute: AppRouter.instance.generator,
    );
  }
}
