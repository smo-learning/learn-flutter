import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  List<Map<String, Object>> _answers;
  Function _answerCallback;
  Answers(this._answers, this._answerCallback);

  List<Widget> get buttonAnswers {
    return _answers
        .map((answerObject) => RaisedButton(
              child: Text(answerObject["answer"]),
              onPressed: () => _answerCallback(answerObject),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: buttonAnswers,
      ),
    );
  }
}
