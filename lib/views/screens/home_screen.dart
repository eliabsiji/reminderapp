import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reminderapp/routes/routes.dart';
import 'package:reminderapp/viewmodels/home_view_model.dart';
import 'package:reminderapp/views/screens/login.dart';
import 'package:reminderapp/views/widgets/primary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          SizedBox(
              height: 50,
              width: 130,
              child: GestureDetector(
                  onTap: () {
                    if (kDebugMode) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInScreen()));
                    }
                  },
                  child: const PrimaryButton(buttonText: "back to login"))),
          const Center(
            child: Text("welcome home"),
          ),
        ],
      ),
    );
  }
}
