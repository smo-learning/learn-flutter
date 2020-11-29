import 'package:assignment_one_basics/shownText.dart';
import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final _shownText;
  final _onButtonClick;

  TextControl(this._shownText, this._onButtonClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ShownText(this._shownText),
          RaisedButton(
            child: Text("Hallo"),
            onPressed: _onButtonClick,
          )
        ],
      ),
    );
  }
}
