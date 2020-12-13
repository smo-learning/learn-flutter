import 'package:flutter/material.dart';

import 'models/expense.dart';
import 'widgets/add_expense.dart';
import 'widgets/list_expense.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: _HomePage(),
    );
  }
}

class _HomePageState extends State<_HomePage> {
  final List<Expense> _expenses = [
    Expense("Test", 1.0, DateTime.now()),
    Expense("Test2", 46.23, DateTime.now()),
    Expense("Test3", 15.0, DateTime.now()),
  ];

  _addExpense(String title, double amount) {
    setState(() {
      this._expenses.add(Expense(title, amount, DateTime.now()));
    });
  }

  _onShowAddExpense(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: AddExpense(_addExpense),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense App'),
      ),
      body: Column(
        children: [
          ListExpense(_expenses),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _onShowAddExpense(context),
      ),
    );
  }
}

class _HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}
