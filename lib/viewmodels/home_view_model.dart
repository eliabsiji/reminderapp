
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:reminderapp/models/userlogin/user_login_success.dart';
import 'package:reminderapp/routes/routes_name.dart';
import 'package:reminderapp/viewmodels/user_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel with ChangeNotifier {
  bool _welcomeMsg = false;
  late UserViewModel userViewModel;
  late String _username;
  late String _token;

  //getters
  bool get welcomeMsg => _welcomeMsg;
  String get username => _username;
  String get token => _token;

  //setters
  setUsername(String username) {
    _username = username;
  }

  setToken(String token) {
    _token = token;
  }

  setWelcomeMsg(bool value) {
    _welcomeMsg = value;
    notifyListeners();
  }

  void displayMsg() {
    setWelcomeMsg(true);
  }

  void back(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.splashscreen);
  }

  Future<UserLoginSuccessl> getUserData() {
    return UserViewModel().getUser();
  }

  void loadUserData() async {
  
  
  }
}
