import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x4CFFC673),
      appBar: AppBar(
        backgroundColor: Color(0x4CFFC673),
        title: Text(
          'Четыре лапы',
          style: TextStyle(
            color: Color(0xFF0261BC),
            fontSize: 36,
            fontFamily: 'Comforter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text("Авторизация",
                  style: TextStyle(
                    color: Color(0xFF0261BC),
                    fontSize: 24,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    height: -5,
                  ),
                  textAlign: TextAlign.center),
              Padding(
                padding: EdgeInsets.only(top: 70),
                child: Column(children: <Widget>[
                  Text(
                    'Электронная почта',
                    style: TextStyle(height: -3),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Введите адрес электронной почты',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: 70),
                child: Column(children: <Widget>[
                  Text('Пароль',
                      style: TextStyle(height: -3), textAlign: TextAlign.left),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Введите пароль',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ]),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Color(0xFF3B6BE7),
                ),
                onPressed: () {
                  // Действия по входу
                },
                child: Text(
                  'Войти',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                width: 328,
                child: Text(
                  'или войти с помощью',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w200,
                    height: 3,
                  ),
                ),
              ),
              Container(
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    Container(
                        width: 24,
                        height: 24,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Row(children: [
                          Expanded(
                            child: Image(
                                image: NetworkImage(
                                    'https://static-00.iconduck.com/assets.00/vk-icon-2048x2048-vg727mul.png')),
                          ),
                        ])),
                  ])),
                  SizedBox(height: 20,),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Восстановить пароль',
                  style: TextStyle(
                    color: Color(0xFF4BB2F9),
                    fontSize: 16,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    height: 0.08,
                    letterSpacing: 0.10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
