import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:laps/model/user_model.dart';

class UserRepository {

Future<void> registerUser(email, password, context) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8080/api/users/registr'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
  
    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/home');
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
    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/home');
    } else {
      // Registration failed
      print('Login failed');
      // Handle error, show error message, etc.
    }
  }
}
