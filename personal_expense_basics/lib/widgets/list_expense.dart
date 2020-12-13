import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_basics/models/expense.dart';

class ListExpense extends StatelessWidget {
  final List<Expense> _expenses;

  ListExpense(this._expenses);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return _generateCardForExpense(_expenses[index]);
        },
        itemCount: _expenses.length,
      ),
    );
    // return Column(
    //   children: this._expenses.map((e) => _generateCardForExpense(e)).toList(),
    // );
  }

  Card _generateCardForExpense(Expense expense) {
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
        ),
        // Row(
        //   children: [
        //     Container(
        //       decoration: BoxDecoration(
        //         border: Border.all(
        //           color: Colors.purple,
        //           width: 2,
        //         ),
        //       ),
        //       child: Container(
        //         margin: EdgeInsets.all(10),
        //         child: Text(expense.amount.toString()),
        //       ),
        //     ),
        //     Spacer(),
        //     Container(
        //       margin: EdgeInsets.only(
        //         left: 10,
        //         right: 10,
        //       ),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.end,
        //         // mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //           FittedBox(
        //             fit: BoxFit.fitWidth,
        //             child: Text(expense.title),
        //           ),
        //           Text(DateFormat.yMMMd().format(expense.date)),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
