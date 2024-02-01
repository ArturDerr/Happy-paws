// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:laps/pages/currents/current_user.dart';
import 'package:laps/pages/custom_check_box.dart';
import 'package:laps/repos/user_repository.dart';

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
                  'Счастливые лапы',
                  style: TextStyle(
                    color: Color(0xFF0261BC),
                    fontSize: 36,
                    fontFamily: 'Comforter',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.44,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Регистрация',
                  style: TextStyle(
                    color: Color(0xFF0261BC),
                    fontSize: 24,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Имя',
                        style: TextStyle(
                          color: Color(0xFF0261BC),
                          fontSize: 15,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: _usernameController,
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Введите ваше имя',
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          hintStyle: TextStyle(
                            color: Color.fromARGB(153, 63, 70, 78),
                            fontSize: 16,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w900,
                            height: 0.08,
                            letterSpacing: 0.10,
                          ),
                          border: OutlineInputBorder(
                            // устанавливаем тонкую границу
                            borderRadius: BorderRadius.circular(15),
                        
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Пароль',
                        style: TextStyle(
                          color: Color(0xFF0261BC),
                          fontSize: 15,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(
                            color: Color.fromARGB(153, 63, 70, 78),
                            fontSize: 16,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w900,
                            height: 0.08,
                            letterSpacing: 0.10,
                          ),
                          border: OutlineInputBorder(
                            // устанавливаем тонкую границу
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color.fromARGB(220, 255, 255, 255), // устанавливаем цвет границы
                              width: 1.0, // устанавливаем толщину границы
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Пароль повторно',
                        style: TextStyle(
                          color: Color(0xFF0261BC),
                          fontSize: 15,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(
                            color: Color.fromARGB(153, 63, 70, 78),
                            fontSize: 16,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w900,
                            height: 0.08,
                            letterSpacing: 0.10,
                          ),
                          border: OutlineInputBorder(
                            // устанавливаем тонкую границу
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.grey, // устанавливаем цвет границы
                              width: 1.0, // устанавливаем толщину границы
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Я владею питомцем',
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
                  CustomCheckbox(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value ?? false;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
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
                            fontSize: 16,
                            fontFamily: 'RalewayNormal',
                            fontWeight: FontWeight.w900,
                            height: 0.08,
                            letterSpacing: 0.10,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3B6BE7),
                          minimumSize: Size(double.infinity, 44),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'или войти с помощью',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'RalewayNormal',
                          fontWeight: FontWeight.w900,
                          height: 0.09,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              child: Image(
                                alignment: Alignment.center,
                                  image: AssetImage('assets/images/vk.png'),
                              ),
                            ),
                            // Иконка Яндекса
                            Image(
                              alignment: Alignment.center,
                              image: AssetImage('assets/images/yandex.png'),
                            ),
                          ],
                        ),
                      ],
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
