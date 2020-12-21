import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  final Function _addExpense;

  AddExpense(this._addExpense);

  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _addValidExpense() {
    String title = _titleController.text;

    if (title.isEmpty) {
      return;
    }
    double amount = double.parse(_amountController.text);
    if (amount <= 0) {
      return;
    }

    widget._addExpense(title, amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Title",
            ),
            controller: _titleController,
            onSubmitted: (_) => _addValidExpense(),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Amount",
            ),
            controller: _amountController,
            onSubmitted: (_) => _addValidExpense(),
          ),
          RaisedButton(
            child: Text("Add Expense"),
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.button.color,
            onPressed: _addValidExpense,
          )
        ],
      ),
    );
  }
}
