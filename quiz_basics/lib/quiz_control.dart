import 'package:flutter/material.dart';
import 'package:quiz_basics/answers.dart';
import 'package:quiz_basics/question.dart';
import 'package:quiz_basics/result.dart';

const questions = [
  {
    "question": "What's your favourite Color?",
    "answers": [
      {"answer": "Red", "score": 1},
      {"answer": "Blue", "score": 2},
      {"answer": "Green", "score": 3}
    ]
  },
  {
    "question": "Who loves Suvrathi the most?",
    "answers": [
      {"answer": "Nils", "score": 1},
      {"answer": "Nilsi", "score": 2},
      {"answer": "Schuni", "score": 3}
    ]
  }
];

class QuizControl extends StatefulWidget {
  @override
  _QuizControlState createState() => _QuizControlState();
}

class _QuizControlState extends State<QuizControl> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _handleAnswer(answer) {
    setState(() {
      _questionIndex += 1;
    });

    _totalScore += answer["score"];
    print(_totalScore);
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  List<Widget> get quiz {
    if (this._questionIndex < questions.length) {
      return [
        Question(questions[_questionIndex]["question"]),
        Answers(questions[_questionIndex]["answers"], _handleAnswer)
      ];
    } else {
      return [Result(this._totalScore, this._resetQuiz)];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        children: this.quiz,
      ),
    );
  }
}
