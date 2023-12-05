import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:laps/model/user_model.dart';
import 'package:laps/pages/currents/current_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {

Future<void> registerUser(email, password, context) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8080/api/users/registr'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Registration failed
      print('Registration failed');
      // Handle error, show error message, etc.
    }
  }

  Future<void> loginUser(email, password, context) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8080/api/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
      
    );
    User(email: email, password: password);
    
    if (response.statusCode == 200 && response.body != '') {
      print(response.body);
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Registration failed
      print('Login failed');
      // Handle error, show error message, etc.
    }
  }

  void findUser(email) async {
    var url = Uri.parse('http://127.0.0.1:8080/api/users/$email');

    var response = await http.get(url);

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print('Ошибка при запросе: ${response.statusCode}');
  }
  }
}
