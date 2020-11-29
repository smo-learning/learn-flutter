import 'package:flutter/material.dart';

import 'quiz_control.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz"),
        ),
        body: QuizControl(),
      ),
    );
  }
}
