import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String _question;

  Question(this._question);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_question),
    );
  }
}
