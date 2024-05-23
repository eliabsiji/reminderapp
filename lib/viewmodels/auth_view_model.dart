import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:reminderapp/helper/app_status.dart';
import 'package:reminderapp/models/userlogin/user_login_error.dart';
import 'package:reminderapp/models/userlogin/user_login_success.dart';
import 'package:reminderapp/repository/auth_repository.dart';
import 'package:reminderapp/routes/routes_name.dart';
import 'package:reminderapp/utils/utils.dart';
import 'package:reminderapp/viewmodels/user_view_model.dart';

class AuthViewModel with ChangeNotifier {
  bool _isLoading =
      false; // A flag to track the loading state during the login process.

  String? _loginError; // Error message in case the login process fails.
  final _myRepo = AuthRepository();
  late UserLoginError _userLoginError;

  // Getters to access the error message and loading state.
  String? get loginError => _loginError;

  bool get isLoading => _isLoading;

  UserLoginError get userLoginError => _userLoginError;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  setUserLoginError(UserLoginError userLoginError) {
    _userLoginError = userLoginError;
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    print(data);
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);

      // Navigator.pushNamed(context, RoutesName.index);
      // Utils.flushBarSuccessMessage("Success", "Login Successful", context);
      if (value is Success) {
        dynamic responseJson = jsonDecode(value.response.toString());
        final userPeference =
            Provider.of<UserViewModel>(context, listen: false);
        userPeference.saveUser(UserLoginSuccessl(
            username: responseJson['username'].toString(), token: responseJson['token'].toString()));
        Navigator.pushNamed(context, RoutesName.index);
        Utils.flushBarSuccessMessage(
            "Success", "Welcome to TravelnownoW App", context);
      } else if (value is Failure) {
        print(value.errorResponse as UserLoginError);
        setUserLoginError(value.errorResponse as UserLoginError);
        String errMsg = _userLoginError.message.toString();
        Navigator.pushNamed(context, RoutesName.login);
        Utils.flushBarErrorMessage("Login Failed", errMsg.toString(), context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage("Failed", error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
