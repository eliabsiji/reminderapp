// import 'package:flutter/cupertino.dart';
// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reminderapp/helper/navigator.dart';
import 'package:reminderapp/screens/reset_password.dart';
import 'package:reminderapp/screens/signup.dart';
import 'package:reminderapp/theme.dart';
import 'package:reminderapp/viewmodels/login_viewmodel.dart';
import 'package:reminderapp/widgets/login_form.dart';
import 'package:reminderapp/widgets/primary_button.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(
            create: (_) => LoginViewModel(NavigationService.instance))
      ],
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Padding(
            padding: kDefaultPadding,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Text(
                    'Hello,Welcome Back',
                    style: titleText,
                  ),
                  const SizedBox(
                    height: 5,
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
                            decoration: TextDecoration.underline,
                            decorationThickness: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const LogInForm(),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ResetPasswordScreen()));
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: kZambeziColor,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () => {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (formKey.currentState!.validate())
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            )
                          }
                      },
                      child: const PrimaryButton(
                        buttonText: 'Log In',
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  // Text(
                  //   'Or log in with:',
                  //   style: subTitle.copyWith(color: kBlackColor),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  // const LoginOption(),
                  Builder(builder: (context) {
                    final loginController =
                        Provider.of<LoginViewModel>(context);

                    return ListView.builder(
                      itemCount: loginController.allData.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListTile(
                            tileColor: Colors.amber,
                            title: Text("Title"),
                            subtitle: Text("Subtitle"),
                            // trailing: PopupMenuButton(
                            //  child: Icon(Icons.more_vert),
                            //   // itemBuilder:
                            // //   itemBuilder: (BuildContext context) {

                            // //  },

                            //   ),
                          ),
                        );
                      },
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
