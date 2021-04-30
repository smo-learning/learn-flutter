import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  static final authUrl = Uri.parse(
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDkcMaUM0YR9n34h_ESh293tPNZ-Rz9ArQ");

  Future<void> signup(String email, String password) async {
    var encode = json.encode({
      'email': email,
      'password': password,
      'returnSecureToken': true,
    });
    final response = await http.post(authUrl, body: encode);
    print(json.decode(response.body));
  }
}
