// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.only(top: 30, left: 25, right: 20),
          color: Color(0x4CFFC673),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Сервис по выгулу\nдомашних питомцев',
                style: TextStyle(
                  color: Color(0xFF0260BC),
                  fontSize: 32,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w300,
                  height: 0,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('assets/images/paws.png'))
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Четыре лапы',
                    style: TextStyle(
                      color: Color(0xFF0261BC),
                      fontSize: 42,
                      fontFamily: 'Comforter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: -0.63,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'добро пожаловать',
                    style: TextStyle(
                      color: Color(0xFF0261BC),
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(children: [
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(
                                'Войти',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF3B6BE7),
                                minimumSize: Size(149, 44),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.only(left: 40),
                            child: Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/registration');
                                },
                                child: Text(
                                  'Регистрация',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF3B6BE7),
                                  minimumSize: Size(149, 44),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ]),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
