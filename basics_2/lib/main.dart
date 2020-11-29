import 'package:basics_2/question.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Cool App"),
        ),
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Question("Hallo Welt!"),
            ],
          ),
        ),
      ),
    );
  }
}
