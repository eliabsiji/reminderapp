import 'package:flutter/material.dart';
import 'package:reminderapp/helper/navigator.dart';
import 'package:reminderapp/helper/networkapis.dart';
import 'package:reminderapp/models/login_model.dart';

class LoginViewModel extends ChangeNotifier {
  final NavigationService _navigationService;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  List<LoginModel> allData = [];

  LoginViewModel(this._navigationService);

  getAll() async {
    _navigationService.showloader();
    var resData = await ApiProvider().get();
    if (resData) {
      print("resdata works");
    }
    allData =
        resData.map<LoginModel>((item) => LoginModel.fromJson(item)).toList();
    print(allData);
    notifyListeners();
  }
}
