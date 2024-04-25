// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:reminderapp/theme.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isObscure = true;
  Map<String, IconData> iconMapping = {
  'person' : Icons.person,
  'email' : Icons.email,
  'phone' : Icons.phone,
  'password' : Icons.password,
};



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputForm('First Name', false, iconMapping['person']!),
        buildInputForm('Last Name', false,iconMapping['person']!),
        buildInputForm('Email', false,iconMapping['email']!),
        buildInputForm('Phone', false,iconMapping['phone']! ),
        buildInputForm('Password', true,iconMapping['password']!),
        buildInputForm('Confirm Password', true,iconMapping['password']!),
      ],
    );
  }

  Padding buildInputForm(String hint, bool pass, IconData iconMapping) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          obscureText: pass ? _isObscure : false,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: kTextFieldColor),
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none),
            fillColor:
                const Color.fromARGB(255, 169, 202, 241).withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(iconMapping),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
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
                          ))
                : null,
          ),
        ));
  }
  
}
