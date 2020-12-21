import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  final Function _addExpense;

  AddExpense(this._addExpense);

  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _addValidExpense() {
    String title = _titleController.text;

    if (title.isEmpty) {
      return;
    }
    double amount = double.parse(_amountController.text);
    if (amount <= 0) {
      return;
    }

    widget._addExpense(title, amount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((value) {
      setState(() {
        this._selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Title",
            ),
            controller: _titleController,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Amount",
            ),
            controller: _amountController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_selectedDate == null
                  ? "No date Chosen"
                  : 'Choosen Date: ${DateFormat.yMd().format(_selectedDate)}'),
              FlatButton(
                onPressed: _presentDatePicker,
                child: Text("Choose Date"),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
              ),
            ],
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
