import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_basics/models/expense.dart';

class ListExpense extends StatelessWidget {
  final List<Expense> _expenses;
  final Function _deleteExpense;

  ListExpense(this._expenses, this._deleteExpense);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return _generateCardForExpense(_expenses[index], context);
        },
        itemCount: _expenses.length,
      ),
    );
    // return Column(
    //   children: this._expenses.map((e) => _generateCardForExpense(e)).toList(),
    // );
  }

  Card _generateCardForExpense(Expense expense, BuildContext ctxt) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: EdgeInsets.all(6),
              child: FittedBox(
                child: Text('${expense.amount}€'),
              ),
            ),
          ),
          title: Text(expense.title),
          subtitle: Text(DateFormat.yMMMd().format(expense.date)),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            color: Theme.of(ctxt).errorColor,
            onPressed: () => _deleteExpense(expense.id),
          ),
        ),
      ),
    );
  }
}
