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
import 'package:reminderapp/views/screens/home_screen.dart';
import 'package:reminderapp/views/screens/login.dart';
import 'package:reminderapp/views/screens/profile.dart';
import 'package:reminderapp/views/screens/reminder_screen.dart';
import 'package:reminderapp/views/screens/travels_screen.dart';
import 'package:reminderapp/views/widgets/primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _seletedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            selectedIndex: _seletedIndex,
            onTabChange: (value) {
              print(value);
              setState(() {
                _seletedIndex = value;
              });
            },
            rippleColor: const Color.fromARGB(
                255, 75, 189, 128), // tab button ripple color when pressed
            hoverColor: const Color.fromARGB(
                255, 75, 189, 128), // tab button hover color
            curve: Curves.easeOutExpo, // tab animation curves
            duration:
                const Duration(milliseconds: 500), // tab animation duration
            haptic: true, // haptic feedback
            backgroundColor: Colors.white,
            activeColor: Colors.green,
            iconSize: 24,
            gap: 5.0,
            padding: const EdgeInsets.all(25),

            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.card_travel,
                text: 'Travels',
              ),
              GButton(
                icon: Icons.remember_me,
                text: 'Reminders',
              ),
              //  GButton(icon:Icons.checklist_rounded,text: 'Profiles',),
              GButton(
                icon: LineIcons.user,
                text: 'Profiles',
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _seletedIndex,
          children: const [HomeScreen(), Travels(), Reminder(), Profile()],
        ),
      ),
    );
  }
}
