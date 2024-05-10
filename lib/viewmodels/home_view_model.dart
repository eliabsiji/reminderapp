import 'package:flutter/cupertino.dart';
import 'package:reminderapp/routes/routes_name.dart';

class HomeViewModel with ChangeNotifier {
  bool _welcomeMsg = false;

  bool get welcomeMsg => _welcomeMsg;

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
}
