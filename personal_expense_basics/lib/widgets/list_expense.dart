import 'package:flutter/material.dart';
import 'package:personal_expense_basics/models/expense.dart';

class ListExpense extends StatelessWidget {
  final List<Expense> _expenses;

  ListExpense(this._expenses);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: this._expenses.map((e) => _generateCardForExpense(e)).toList(),
    );
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
