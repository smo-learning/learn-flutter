import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_counter/features/counter/presentation/pages/counter_page.dart';
import 'package:flutter_counter/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  // runZonedGuarded(() {
  runApp(MyApp());
  // }, (Object error, StackTrace stack) {
  //   // log stack
  //   print(stack);
  // });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterPage(),
    );
  }
}
