import 'package:flutter/material.dart';
import 'package:personal_expense_basics/models/chart_day.dart';

class ChartBar extends StatelessWidget {
  final ChartDay _chartDay;
  final double _pctOfTotalSpending;

  const ChartBar(this._chartDay, this._pctOfTotalSpending);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 20,
            child: FittedBox(
              child: Text('${_chartDay.totalAmount.toStringAsFixed(0)}€'),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 60,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: _pctOfTotalSpending,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(_chartDay.weekDay),
        ],
      ),
    );
  }
}
