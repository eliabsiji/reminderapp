import 'package:flutter/cupertino.dart';

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
}
