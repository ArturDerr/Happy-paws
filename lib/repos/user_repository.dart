import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static const emailKey = 'emailKey';

  Future<void> registerUser(nickname, password, context) async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      print('нет интернета');
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8080/api/users/registr'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'nickname': nickname, 'password': password}),
      );
      if (response.statusCode == 200) {
        Navigator.pushReplacementNamed(context, '/home');
        var prefs = await SharedPreferences.getInstance();
        prefs.setString('emailKey', nickname);
        print(prefs.getString(emailKey));
        // await prefs.setString('password', password);
      } else {
        // Registration failed
        print('Registration failed');
        // Handle error, show error message, etc.
      }
    }
  }

  Future<void> loginUser(nickname, password, context) async {
    // Получение текущего состояния подключения
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      print('нет интернета');
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8080/api/users/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'nickname': nickname, 'password': password}),
      );

      if (response.statusCode == 200 && response.body != '') {
        print(response.body);
        var prefs = await SharedPreferences.getInstance();
        prefs.setString('emailKey', nickname);
        print(prefs.getString(emailKey));
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Registration failed
        print('Login failed');
        // Handle error, show error message, etc.
      }
    }
  }

  Future<void> deleteData(nickname) async {
    var apiUrl =
        Uri.parse('http://127.0.0.1:8080/api/users/delete-user/$nickname');

    final response = await http.delete(apiUrl);

    if (response.statusCode == 200) {
      print('Данные удалены.');
    } else {
      print('Ошибка удаления данных: ${response.statusCode}');
    }
  }

  Future<void> addEmail(nickname, email) async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      print('нет интернета');
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8080/api/users/add-email/$nickname'),
        headers: {'Content-Type': 'application/json'},
        body: email,
      );
      if (response.statusCode == 200) {
        print(email);
      } else {
        // Registration failed
        print('Registration failed');
        // Handle error, show error message, etc.
      }
    }
  }
}
