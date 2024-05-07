import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reminderapp/routes/routes_name.dart';
import 'package:reminderapp/views/screens/home_screen.dart';
import 'package:reminderapp/views/screens/login.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext) => const HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext) => const LogInScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route Defined'),
            ),
          );
        });
    }
  }
}
