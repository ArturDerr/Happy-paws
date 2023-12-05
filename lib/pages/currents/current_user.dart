import 'package:shared_preferences/shared_preferences.dart';

class DataBloc {

  static final DataBloc _singleton = DataBloc._internal();
  static const emailKey = 'emailKey';

  factory DataBloc() {
    return _singleton;
  }

  DataBloc._internal();

  String _email = "";

  String get email => _email;

  void setEmail(String email) async {
    _email = email;
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(emailKey, email);
    print(prefs);
  }

}