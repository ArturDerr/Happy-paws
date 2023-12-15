import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static const emailKey = 'emailKey';

  Future<void> registerUser(email, password, context) async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      print('нет интернета');
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8080/api/users/registr'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      if (response.statusCode == 200) {
        Navigator.pushReplacementNamed(context, '/home');
        var prefs = await SharedPreferences.getInstance();
        prefs.setString('emailKey', email);
        print(prefs.getString(emailKey));
        // await prefs.setString('password', password);
      } else {
        // Registration failed
        print('Registration failed');
        // Handle error, show error message, etc.
      }
    }
  }

  Future<void> loginUser(email, password, context) async {
    // Получение текущего состояния подключения
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      print('нет интернета');
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8080/api/users/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200 && response.body != '') {
        print(response.body);
        var prefs = await SharedPreferences.getInstance();
        prefs.setString('emailKey', email);
        print(prefs.getString(emailKey));
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Registration failed
        print('Login failed');
        // Handle error, show error message, etc.
      }
    }
  }

  Future<void> deleteData(email) async {
    var apiUrl =
        Uri.parse('http://127.0.0.1:8080/api/users/delete-user/$email');

    final response = await http.delete(apiUrl);

    if (response.statusCode == 200) {
      print('Данные удалены.');
    } else {
      print('Ошибка удаления данных: ${response.statusCode}');
    }
  }

  // void findUser(email) async {
  //   var url = Uri.parse('http://127.0.0.1:8080/api/users/$email');
  //   var response = await http.get(url);

  // if (response.statusCode == 200) {
  //   print(response.body);
  // } else {
  //   print('Ошибка при запросе: ${response.statusCode}');
  // }
  // }
}
