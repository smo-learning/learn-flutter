import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  Function _addExpense;

  AddExpense(this._addExpense);

  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  _addValidExpense() {
    String title = _titleController.text;
    double amount = double.parse(_amountController.text);
    widget._addExpense(title, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
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
        ],
      ),
    );
  }
}
