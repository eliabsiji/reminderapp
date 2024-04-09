import 'package:flutter/material.dart';
import 'package:reminderapp/helper/navigator.dart';

class LoginViewModel extends ChangeNotifier {
  final NavigationService _navigationService;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  LoginViewModel(this._navigationService);

  testing() {
    print(emailcontroller.text);
    print(passwordcontroller.text);
  }
}
