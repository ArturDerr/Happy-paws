import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UserRepository {
  void registrUser(email, password) async {
    var _email = email;
    var _password = password;
    try {

      var responce = await http.post(
        Uri.parse('http://127.0.0.1:8080/api/users/registr'),
        body: {'email': _email, 'password': _password},
        
      );
    } catch (error) {
      print("error: $error");
    }
  }
}
