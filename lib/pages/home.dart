// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:laps/repos/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class Account extends StatefulWidget {
  @override
  _Account createState() => _Account();
}

class _MyBottomNavigationBarState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Page2(),
    Page3(),
    Page4(),
    Page5(),
    Account(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x4CFFC673),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 199, 115),
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets_outlined),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_walk),
            label: 'Page 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Page 4',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Page 5',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Аккаунт',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}

// Placeholder pages for demonstration
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          color: Color(0x4CFFC673),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
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
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Icon(Icons.favorite), // иконка
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Мои питомцы',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            height: 0.08,
                            letterSpacing: 0.10,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          minimumSize: Size(304, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.account_box), // иконка
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Аккаунт',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                          height: 0.08,
                          letterSpacing: 0.10,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        minimumSize: Size(304, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Opacity(
                opacity: 0.12,
                child: Container(
                  width: 304,
                  height: 1,
                  decoration: BoxDecoration(color: Color(0xFF002033)),
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12, left: 16),
                child: Row(
                  children: [
                    Text(
                      'События и уведомления',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w200,
                        height: 0.10,
                        letterSpacing: 0.10,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Icon(Icons.pets), // иконка
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'План прогулок',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                          height: 0.08,
                          letterSpacing: 0.10,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        minimumSize: Size(304, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.message), // иконка
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Сообщения',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                          height: 0.08,
                          letterSpacing: 0.10,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        minimumSize: Size(304, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.notification_important), // иконка
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Уведомления',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                          height: 0.08,
                          letterSpacing: 0.10,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        minimumSize: Size(304, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Opacity(
                opacity: 0.12,
                child: Container(
                  width: 304,
                  height: 1,
                  decoration: BoxDecoration(color: Color(0xFF002033)),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12, left: 16),
                child: Row(
                  children: [
                    Text(
                      'Дополнительно',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w200,
                        height: 0.10,
                        letterSpacing: 0.10,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Icon(Icons.edit_document), // иконка
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Политика конфиденциальности',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                          height: 0.08,
                          letterSpacing: 0.10,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        minimumSize: Size(304, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.document_scanner), // иконка
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Пользовательское соглашение',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                          height: 0.08,
                          letterSpacing: 0.10,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        minimumSize: Size(304, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page 2'),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page 3'),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page 4'),
    );
  }
}

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page 5'),
    );
  }
}

class _Account extends State {
  String email = '';
  String nickname = '';

  // final ImagePicker _picker = ImagePicker();
  // File? _image;
  // Widget _buildAvatar() {
  //   if (_image != null) {
  //     return Container(
  //       width: 100,
  //       height: 100,
  //       decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         image: DecorationImage(
  //           image: FileImage(_image!),
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //     );
  //   } else {
  //     return Container(
  //       width: 100,
  //       height: 100,
  //       decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         color: Colors.grey,
  //       ),
  //       child: Icon(
  //         Icons.person,
  //         color: Colors.white,
  //         size: 50,
  //       ),
  //     );
  //   }
  // }

  // Future<void> _pickImage() async {
  //   final pickedImage = await _picker.getImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     setState(() {
  //       _image = File(pickedImage.path);
  //     });
  //   }
  // }

  // Future<void> _takePhoto() async {
  //   final newImage = await _picker.getImage(source: ImageSource.camera);
  //   if (newImage != null) {
  //     setState(() {
  //       _image = File(newImage.path);
  //     });
  //   }
  // }
  Future<void> clearValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Очищаем все значения SharedPreferences
  }

  var currentEmail = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.only(top: 14, left: 9, right: 9),
          color: Color(0x4CFFC673),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Container(
                      width: 66,
                      height: 66,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://media.istockphoto.com/id/1300845620/ru/%D0%B2%D0%B5%D0%BA%D1%82%D0%BE%D1%80%D0%BD%D0%B0%D1%8F/%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8C-icon-flat-%D0%B8%D0%B7%D0%BE%D0%BB%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD-%D0%BD%D0%B0-%D0%B1%D0%B5%D0%BB%D0%BE%D0%BC-%D1%84%D0%BE%D0%BD%D0%B5-%D1%81%D0%B8%D0%BC%D0%B2%D0%BE%D0%BB-%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8F-%D0%B8%D0%BB%D0%BB%D1%8E%D1%81%D1%82%D1%80%D0%B0%D1%86%D0%B8%D1%8F-%D0%B2%D0%B5%D0%BA%D1%82%D0%BE%D1%80%D0%B0.jpg?s=612x612&w=0&k=20&c=Po5TTi0yw6lM7qz6yay5vUbUBy3kAEWrpQmDaUMWnek='),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Аккаунт',
                    style: TextStyle(
                      color: Color(0xFF0261BC),
                      fontSize: 24,
                      fontFamily: 'IBM Plex Sans',
                      fontWeight: FontWeight.w300,
                      height: -3,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text('сменить фото'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18, top: 4),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      FutureBuilder<String>(
                        future: getTextFromPreferences(),
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          if (snapshot.hasData) {
                            currentEmail = snapshot.data.toString();
                            nickname = snapshot.data.toString();
                            return Text(
                              'Привет, ' + snapshot.data.toString(),
                              style: TextStyle(
                                color: Color(0xFF0261BC),
                                fontSize: 16,
                                fontFamily: 'IBM Plex Sans',
                                fontWeight: FontWeight.w300,
                                height: -3,
                              ),
                            );
                          }
                          return CircularProgressIndicator();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Icon(Icons.refresh), // иконка
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Введите почту'),
                                  content: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        email = value;
                                      });
                                    },
                                  ),
                                  actions: [
                                    Row(
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              UserRepository()
                                                  .addEmail(nickname, email);
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Добавить')),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Закрыть'))
                                      ],
                                    )
                                  ],
                                );
                              });
                        },
                        child: Text(
                          'Добавить почту',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            height: 0.08,
                            letterSpacing: 0.10,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          minimumSize: Size(360, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          backgroundColor: Color(0x59FFC673),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Icon(Icons.card_membership), // иконка
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Привязать способ оплаты',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            height: 0.08,
                            letterSpacing: 0.10,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          minimumSize: Size(360, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          backgroundColor: Color(0x59FFC673),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Icon(Icons.refresh), // иконка
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Изменить пароль',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            height: 0.08,
                            letterSpacing: 0.10,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          minimumSize: Size(360, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          backgroundColor: Color(0x59FFC673),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Icon(Icons.refresh), // иконка
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Изменить почту',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            height: 0.08,
                            letterSpacing: 0.10,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          minimumSize: Size(360, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          backgroundColor: Color(0x59FFC673),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Icon(Icons.smartphone), // иконка
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Изменить телефон',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            height: 0.08,
                            letterSpacing: 0.10,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          minimumSize: Size(360, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          backgroundColor: Color(0x59FFC673),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Icon(Icons.help), // иконка
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Служба поддержки',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            height: 0.08,
                            letterSpacing: 0.10,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          minimumSize: Size(360, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          backgroundColor: Color(0x59FFC673),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          clearValue();
                          Navigator.pushReplacementNamed(context, '/');
                        },
                        child: Text(
                          'Выйти',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'IBM Plex Sans',
                            fontWeight: FontWeight.w500,
                            height: 0.08,
                            letterSpacing: 0.10,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3B6BE7),
                          minimumSize: Size(150, 35),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/');
                          UserRepository().deleteData(currentEmail);
                          clearValue();
                        },
                        child: Text(
                          'Удалить аккаунт',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'IBM Plex Sans',
                            fontWeight: FontWeight.w500,
                            height: 0.08,
                            letterSpacing: 0.10,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF40D0D),
                          minimumSize: Size(150, 35),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
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

Future<String> getTextFromPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String text = prefs.getString('emailKey').toString();
  return text ?? '';
}
