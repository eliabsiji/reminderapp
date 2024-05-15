// ignore_for_file: unused_import, dead_code
import 'package:flutter/material.dart';
import 'package:reminderapp/views/screens/login.dart';
import 'package:reminderapp/theme.dart';
import 'package:reminderapp/views/widgets/checkbox.dart';
import 'package:reminderapp/views/widgets/login_option.dart';
import 'package:reminderapp/views/widgets/primary_button.dart';
import 'package:reminderapp/views/widgets/signup_form.dart';

class SignUpScreen extends StatefulWidget {
   const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
   bool _isObscure = true;

  Map<String, IconData> iconMapping = {
      'person' : Icons.person,
      'email' : Icons.email,
      'phone' : Icons.phone,
      'password' : Icons.password,
    };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Create Account',
                style: titleText,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Row(
                children: [
                  Text(
                    'Already registered?',
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
                              builder: (context) =>  const LogInScreen()));
                    },
                    child: Text(
                      'Log In',
                      style: textButton.copyWith(
                        decorationThickness: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
             SizedBox(
              height: 200,
              child: Center(
                  child: Image.asset(
                'images/signup logo.png',
              ))),
            const SizedBox(
              height: 5,
            ),
         Padding(
        padding: kDefaultPadding,
        child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: const TextStyle(color: kTextFieldColor,),
            hintText: 'Email',
            hintStyle: const TextStyle(color: kTextFieldColor),
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey)),
            fillColor: Colors.grey,
            filled: false,
            prefixIcon: Icon(iconMapping['email']!),
            focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),),   
              ),
            )
            ),
            ),
        Padding(
        padding: kDefaultPadding,
        child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Username',
            labelStyle: const TextStyle(color: kTextFieldColor,),
            hintText: 'Username',
            hintStyle: const TextStyle(color: kTextFieldColor),
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey)),
            fillColor: Colors.grey,
            filled: false,
            prefixIcon: Icon(iconMapping['person']!),
            focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),),
              ),
            )
            ),
            ),
        Padding(
        padding: kDefaultPadding,
        child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: const TextStyle(color: kTextFieldColor,),
            hintText: 'Password',
            hintStyle: const TextStyle(color: kTextFieldColor),
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey)),
            fillColor: Colors.grey,
            filled: false,
            prefixIcon: Icon(iconMapping['password']!),
            focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),),
            ),
            )
            ),
           ),
        Padding(
        padding: kDefaultPadding,
        child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            labelStyle: const TextStyle(color: kTextFieldColor,),
            hintText: 'Confirm Password',
            hintStyle: const TextStyle(color: kTextFieldColor),
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey)),
            fillColor: Colors.grey,
            filled: false,
            prefixIcon: Icon(iconMapping['password']!),
            focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),),
                ),
              )
              ),
              ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: kDefaultPadding,
              child: CheckBox('Agree to terms and conditions.'),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: kDefaultPadding,
              child: SizedBox( 
                height:49, 
                child: PrimaryButton(buttonText: 'Sign Up')),
            ),
            const SizedBox(
              height: 20,
            ),
            // ignore: prefer_const_constructors
            Padding(
              padding: kDefaultPadding,
              // child: Text(
              //   'Or log in with:',
              //   style: subTitle.copyWith(color: kBlackColor),
              // ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: kDefaultPadding,
              // child: LoginOption(),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
