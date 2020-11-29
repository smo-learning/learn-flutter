import 'package:assignment_one_basics/textControl.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _shownText = "Hallo Welt!";

  void _onButtonClick() {
    setState(() => {this._shownText = "Pressed!"});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment One',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Assignment One"),
        ),
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              TextControl(_shownText, _onButtonClick),
            ],
          ),
        ),
      ),
    );
    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text("My Cool App"),
    //     ),
    //     body: Container(
    //       width: double.infinity,
    //       margin: EdgeInsets.all(10),
    //       child: Column(
    //         children: [
    //           Text("Hallo Welt!"),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

// class MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//     );
//   }
// }
