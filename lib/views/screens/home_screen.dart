import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminderapp/slider.dart';
import 'package:reminderapp/splash_screen.dart';
import 'package:reminderapp/utils/utils.dart';
import 'package:reminderapp/viewmodels/home_view_model.dart';
import 'package:reminderapp/viewmodels/user_view_model.dart';
import 'package:reminderapp/views/screens/login.dart';
import 'package:reminderapp/views/widgets/primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.getUserData();
    // print(homeViewModel.token.toString());
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(child: const Icon(Icons.add), onPressed: () {}),
      body: Column(
        children: [
          BottomAppBar(
            child: GestureDetector(
              onTap: () {
                print(userPreference.toString());
              },
              child: const Tab(
                icon: Icon(Icons.home),
              ),
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          SizedBox(
              height: 50,
              width: 130,
              child: GestureDetector(
                  onTap: () {
                    userPreference.removeUser().then((value) {
                      Utils.flushBarErrorMessage(
                          "End User Session", "You Have Logged out", context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const IntroSlider()));
                    });
                  },
                  child: const PrimaryButton(buttonText: "log out"))),
          SizedBox(
              height: 50,
              width: 200,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SplashScreen()));
                  },
                  child: const PrimaryButton(
                      buttonText: "back to splash screen"))),
          const Center(
            child: Text(''),
          ),
          const Center(
            child: Text('kk'),
          ),
        ],
      ),
    );
  }
}
