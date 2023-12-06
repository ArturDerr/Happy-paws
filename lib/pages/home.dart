// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:laps/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:laps/pages/currents/current_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State {
  String email = '';

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
          child: FutureBuilder<String>(
            future: getTextFromPreferences(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

Future<String> getTextFromPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String text = prefs.getString('emailKey').toString();
  return text ?? '';
}
