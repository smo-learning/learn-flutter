import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment One',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Assignment One"),
        ),
        body: Container(
          child: Column(
            children: [
              Text(
                "Hallo Welt!",
                textAlign: TextAlign.center,
              ),
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
