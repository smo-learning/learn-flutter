import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  int _score;
  Function _resetHandler;

  Result(this._score, this._resetHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Total Score " + this._score.toString()),
          RaisedButton(
            onPressed: _resetHandler,
            child: Text("Reset"),
          )
        ],
      ),
    );
  }
}
