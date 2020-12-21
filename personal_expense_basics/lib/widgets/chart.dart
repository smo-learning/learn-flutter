import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_basics/models/expense.dart';
import 'package:personal_expense_basics/widgets/chart_bar.dart';

import '../models/chart_day.dart';

class Chart extends StatelessWidget {
  final List<Expense> _recentTransactions;

  Chart(this._recentTransactions);

  List<ChartDay> get _groupedExpenses {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalAmount = 0.0;
      for (Expense e in _recentTransactions) {
        if (e.date.day == weekDay.day &&
            e.date.month == weekDay.month &&
            e.date.year == weekDay.year) {
          totalAmount += e.amount;
        }
      }
      return ChartDay(weekDay, totalAmount);
    }).reversed.toList();
  }

  double get totalSpending {
    return _groupedExpenses.fold(0.0, (acc, val) => acc + val.totalAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _groupedExpenses
              .map(
                (e) => Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                      e,
                      totalSpending == 0.0
                          ? 0.0
                          : e.totalAmount / totalSpending),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
