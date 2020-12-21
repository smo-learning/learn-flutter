import 'package:flutter/material.dart';
import 'package:personal_expense_basics/widgets/chart.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              button: TextStyle(color: Colors.white),
            ),
      ),
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

  List<Expense> get _recentTransactions {
    DateTime oneWeekBefore = DateTime.now().subtract(Duration(days: 7));
    return _expenses
        .where((element) => element.date.isAfter(oneWeekBefore))
        .toList();
  }

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
          Chart(_recentTransactions),
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
