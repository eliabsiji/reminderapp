// import 'package:flutter/cupertino.dart';
// ignore_for_file: unnecessary_import, dead_code, must_be_immutable

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reminderapp/api/auth_api_service.dart';
import 'package:reminderapp/helper/app_loading.dart';
import 'package:reminderapp/repo/user_auth_repo.dart';
import 'package:reminderapp/views/screens/reset_password.dart';
import 'package:reminderapp/views/screens/signup.dart';
import 'package:reminderapp/theme.dart';
import 'package:reminderapp/viewmodels/userlogin_viewmodel.dart';
import 'package:reminderapp/views/widgets/login_form.dart';
import 'package:reminderapp/views/widgets/primary_button.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  // Declare the TextEditingControllers at the class level
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool _isObscure = true;
    final formKey = GlobalKey<FormState>();
    final loginviewModel = Provider.of<LoginViewModel>(context);

    Map<String, IconData> iconMapping = {
      'person': Icons.person,
      'password': Icons.password,
    };

    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: kDefaultPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: Text(
                    'Welcome',
                    style: titleText,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                    height: 100,
                    child: Center(
                        child: Image.asset(
                      'images/login logo.png',
                    ))),
                if (loginviewModel.isLoading) 
                const AppLoading(),
                // Show error message if login fails
                if (!loginviewModel.isLoading &&
                    loginviewModel.loginError != null)
                    
                  Text(
                    'loginviewModel.userLoginSuccessl.token.toString()',
                    style: const TextStyle(color: Colors.red),
                  ),
                // Show response message if login is successful
                if (loginviewModel.response != null)
                  Text(
                    'loginviewModel.userLoginSuccessl.token.toString()',
                    style: const TextStyle(color: Colors.green),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: username,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email Field required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: const TextStyle(
                        color: kTextFieldColor,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)),
                      fillColor: Colors.grey,
                      filled: false,
                      prefixIcon: Icon(iconMapping['person']!),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email Field required";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          color: kTextFieldColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey)),
                        fillColor: Colors.grey,
                        filled: false,
                        prefixIcon: Icon(iconMapping['password']!),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                        suffixIcon: true
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                                icon: true
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: kTextFieldColor,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: kPrimaryColor,
                                      ),
                              )
                            : null),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResetPasswordScreen()));
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: kZambeziColor,
                      fontSize: 14,
                      decorationThickness: 2,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                GestureDetector(
                  onTap: () {
                    Map<dynamic, dynamic> req = {
                      "username":username.text,
                      "password":password.text,
                    };
                    loginviewModel.login(req);
                  },
                  child: const SizedBox(
                    height: 49,
                    child: PrimaryButton(
                      buttonText: 'Log In',
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'New to this app?',
                      style: subTitle,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: textButton.copyWith(
                          decorationThickness: 3,
                        ),
                      ),
                    ),
                  ],
                ),
                // Text(
                //   'Or log in with:',
                //   style: subTitle.copyWith(color: kBlackColor),
                // ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
