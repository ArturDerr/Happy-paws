// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:laps/pages/home.dart';
import 'package:laps/pages/login.dart';
import 'package:laps/pages/auth.dart';
import 'package:flutter/services.dart';
import 'package:laps/pages/registration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Скрытие статус бара
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
            
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => AuthPage(),
        '/login': (context) => LoginPage(),
        '/registration': (context) => RegistrPage(),
        '/home': (context) => HomePage(),
      },
    );
    
  }
}