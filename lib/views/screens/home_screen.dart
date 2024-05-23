import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:reminderapp/slider.dart';
import 'package:reminderapp/splash_screen.dart';
import 'package:reminderapp/utils/utils.dart';
import 'package:reminderapp/viewmodels/home_view_model.dart';
import 'package:reminderapp/viewmodels/user_view_model.dart';
import 'package:line_icons/line_icons.dart';
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
    // homeViewModel.getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final userPreference = Provider.of<UserViewModel>(context);

    return const Scaffold(
   
      body:Column(
        children: [
          Text('hello home')
        ],
      ) ,
    );
  }
}
