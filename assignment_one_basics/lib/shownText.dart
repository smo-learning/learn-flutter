import 'package:flutter/material.dart';

class ShownText extends StatelessWidget {
  final _shownText;

  ShownText(this._shownText);

  @override
  Widget build(BuildContext context) {
    return Text(
      this._shownText,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 28,
      ),
    );
  }
}
