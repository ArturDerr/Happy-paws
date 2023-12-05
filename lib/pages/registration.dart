// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laps/model/user_model.dart';
import 'package:laps/pages/currents/current_user.dart';
import 'package:laps/repos/user_repository.dart';
import 'package:http/http.dart' as http;

class RegistrPage extends StatefulWidget {
  const RegistrPage({super.key});

  @override
  _RegistrPage createState() => _RegistrPage();
}

class _RegistrPage extends State {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String email = '';
  String password = '';
  String passwordCheck = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isSwitched = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          color: Color(0x4CFFC673),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Четыре лапы',
                  style: TextStyle(
                    color: Color(0xFF0261BC),
                    fontSize: 36,
                    fontFamily: 'Comforter',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.54,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Регистрация',
                  style: TextStyle(
                    color: Color(0xFF0261BC),
                    fontSize: 24,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Электронная почта',
                        style: TextStyle(
                          color: Color(0xFF0261BC),
                          fontSize: 15,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      TextField(
                        controller: _usernameController,
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Введите вашу почту',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Пароль',
                        style: TextStyle(
                          color: Color(0xFF0261BC),
                          fontSize: 15,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      TextField(
                        controller: _passwordController,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Придумайте пароль',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Пароль повторно',
                        style: TextStyle(
                          color: Color(0xFF0261BC),
                          fontSize: 15,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            passwordCheck = value;
                          });
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Повторите пароль',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    'я владею питомцем',
                    style: TextStyle(
                      color: Color(0xFF0261BC),
                      fontSize: 15,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                      letterSpacing: 0.20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Switch(
                      value: isSwitched,
                      onChanged: (bool value) {
                        setState(() {
                          isSwitched = value;
                        });
                      }),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (password == passwordCheck) {
                          if (email != '' && password != '') {
                            UserRepository()
                                .registerUser(email, password, context);
                              DataBloc().setEmail(email);
                          } else {
                            print("error");
                          }
                        }
                        ;
                      },
                      child: Text(
                        'Зарегистрироваться',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF3B6BE7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
