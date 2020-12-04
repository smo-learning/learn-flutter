import 'package:flutter/material.dart';
import 'package:personal_expense_basics/models/expense.dart';
import 'package:personal_expense_basics/widgets/add_expense.dart';
import 'package:personal_expense_basics/widgets/list_expense.dart';

class ExpenseControl extends StatefulWidget {
  @override
  _ExpenseControlState createState() => _ExpenseControlState();
}

class _ExpenseControlState extends State<ExpenseControl> {
  final List<Expense> _expenses = [
    Expense("Test", 1.0, DateTime.now()),
    Expense("Test2", 46.23, DateTime.now()),
    Expense("Test3", 15.0, DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          AddExpense(),
          ListExpense(_expenses),
        ],
      ),
    );
  }
}
