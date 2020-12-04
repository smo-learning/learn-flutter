import 'package:flutter/material.dart';
import 'package:personal_expense_basics/widgets/expense_control.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal Expense App'),
        ),
        body: Container(
          child: ExpenseControl(),
        ),
      ),
    );
  }
}
