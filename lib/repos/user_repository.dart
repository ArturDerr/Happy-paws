import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:laps/model/registration_model.dart';

class UserRepository {

Future<bool> registerUser(User user) async {
  final url = Uri.parse('http://127.0.0.1:8080/api/users/registr'); // Замените на свой URL API
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: user.toJson(),
    
  );
  print(user);
  print(url);

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
}
