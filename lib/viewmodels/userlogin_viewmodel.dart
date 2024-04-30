import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reminderapp/helper/app_status.dart';
import 'package:reminderapp/models/userlogin/user_login_model.dart';
import 'package:reminderapp/models/userlogin/user_login_success.dart';
import 'package:reminderapp/models/userlogin/userlogin_error_model.dart';
import 'package:reminderapp/repo/user_auth_repo.dart';

class LoginViewModel extends ChangeNotifier {


// Instance of the LoginRepository class to interact with the user login data.
  final AuthRepository authRepository;

  // Constructor to initialize the LoginViewModel with the LoginRepository instance.
  LoginViewModel({required this.authRepository});

  // Private variables to store response and error data from the login process.
  String? _response; // Response from the login API call.
  String? get response => _response; // Getter to access the login response.

  String? _loginError; // Error message in case the login process fails.
  bool _isLoading = false; // A flag to track the loading state during the login process.

  // Getters to access the error message and loading state.
  String? get loginError => _loginError;
  bool get isLoading => _isLoading;

    Future<void> login(Map<dynamic, dynamic> req) async {
    // Set the isLoading flag to true to indicate that the login process is ongoing.
    _isLoading = true;
    // Notify the listeners (usually UI elements) that the state has changed.
    notifyListeners();

    try {
      // Call the login method from the userRepository to initiate the login process.
      _response = await authRepository.login(req);
      // If the login is successful, set the loginError to null.
      _loginError = null;
    } catch (e) {
      // If an error occurs during the login process, catch the error and set the loginError with the error message.
      _loginError = e.toString();
    }

    // Set the isLoading flag back to false to indicate that the login process has completed.
    _isLoading = false;
    // Notify the listeners that the state has changed after completing the login process.
    notifyListeners();
  }
  // bool _loading = false;
  // late UserLoginModel _userLoginModel;
  // late UserLoginErrorModel _userLoginErrorModel;
  // late UserLoginSuccessl _userLoginSuccessl;

  
 

  // bool get loading => _loading;
  // UserLoginModel get userLoginModel => _userLoginModel;
  // UserLoginErrorModel get userLoginErrorModel => _userLoginErrorModel;
  // UserLoginSuccessl get userLoginSuccessl => _userLoginSuccessl;

  // setLoading(bool loading) async {
  //   _loading = loading;
  //   notifyListeners();
  // }

  // setUserLogingModel(UserLoginModel userLoginModel) {
  //   _userLoginModel = userLoginModel;
  // }

  // setUserginError(UserLoginErrorModel userLoginErrorModel) {
  //   _userLoginErrorModel = userLoginErrorModel;
  // }

  // setUserLoginSuccess(UserLoginSuccessl userLoginSuccessl) {
  //   _userLoginSuccessl = userLoginSuccessl;
  // }

  

  // getAuth() async {
  //   setLoading(true);
  //   var response = await AuthApiProvider().userauth({
  //     "username": 'siji',
  //     "password": '1234',
  //   });
  //   if (response is AuthSuccess) {
  //    String jsonResponse = jsonEncode(response.response);
  //     UserLoginSuccessl userSuccess = UserLoginSuccessl.fromJson(
  //       jsonDecode(jsonResponse),
  //     );
  //     setUserLoginSuccess(userSuccess);
  //   }
  //   if (response is AuthFailure) {
  //     UserLoginErrorModel userError = UserLoginErrorModel(
  //       status: response.status,
  //       message: response.response,
  //     );
  //     setUserginError(userError);
  //   }
  //   setLoading(false);
  // }
}
