// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminderapp/helper/navigator.dart';
import 'package:reminderapp/theme.dart';
import 'package:reminderapp/viewmodels/login_viewmodel.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  
  bool _isObscure = true;


  @override
  Widget build(BuildContext context) {
  final logincontroller = Provider.of<LoginViewModel>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(
            create: (_) => LoginViewModel(NavigationService.instance))
      ],
      child: Column(
        children: [
          buildInputForm('Email', false,logincontroller),
          buildInputForm2('Password', true,logincontroller),
          
        ],
      ),
    );
  }

  Padding buildInputForm(String label, bool pass,provider) {
    //final logincontroller = Provider.of<LoginViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: provider.emailcontroller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Email Field required";
          }
          return null;
        },
        obscureText: pass ? _isObscure : false,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              color: kTextFieldColor,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
            ),
            suffixIcon: pass
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: _isObscure
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
    );
  }


    Padding buildInputForm2(String label, bool pass,provider) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: provider.passwordcontroller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Password Field required";
          }
           return null;
        },
        obscureText: pass ? _isObscure : false,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              color: kTextFieldColor,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
            ),
            suffixIcon: pass
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: _isObscure
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
    );
  }
}


