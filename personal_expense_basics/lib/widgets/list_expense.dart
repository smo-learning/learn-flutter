import 'package:flutter/material.dart';
import 'package:personal_expense_basics/models/expense.dart';

class ListExpense extends StatelessWidget {
  final List<Expense> _expenses;

  ListExpense(this._expenses);

  List<Card> get expenseWidgets {
    return this._expenses.map((e) => _generateCardForExpense(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: expenseWidgets,
    );
    // return _generateCardForExpense(this._expenses[0]);
  }

  Card _generateCardForExpense(Expense expense) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.purple,
                  width: 2,
                ),
              ),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(expense.amount.toString()),
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(expense.title),
                  Text(expense.date.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
