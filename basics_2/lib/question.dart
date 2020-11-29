import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.questionText,
        style: TextStyle(
          fontSize: 28,
        ),
      ),
    );
  }
}
