import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reminderapp/routes/routes_name.dart';
import 'package:reminderapp/slider.dart';
import 'package:reminderapp/splash_screen.dart';
import 'package:reminderapp/views/screens/home_screen.dart';
import 'package:reminderapp/views/screens/login.dart';
import 'package:reminderapp/views/screens/profile.dart';
import 'package:reminderapp/views/screens/reminder_screen.dart';
import 'package:reminderapp/views/screens/travels_screen.dart';

class NavigatorRoute extends StatefulWidget {
  const NavigatorRoute({super.key});

  @override
  State<NavigatorRoute> createState() => _NavigatorRouteState();
}

class _NavigatorRouteState extends State<NavigatorRoute> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey, onGenerateRoute: (RouteSettings settings) {
           switch (settings.name) {

      case RoutesName.splashscreen:
        return MaterialPageRoute(
            builder: (BuildContext) =>  const SplashScreen());
      
      case RoutesName.introslider:
        return MaterialPageRoute(
            builder: (BuildContext) =>  const IntroSlider());


      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext) =>  const HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext) => const LogInScreen());
            
      case RoutesName.travels:
        return MaterialPageRoute(
            builder: (BuildContext) => const Travels());
      
      case RoutesName.reminder:
        return MaterialPageRoute(
            builder: (BuildContext) => const Reminder());

      case RoutesName.profile:
        return MaterialPageRoute(
            builder: (BuildContext) => const Profile());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route Defined'),
            ),
          );
        });
    }

        });
  }
}
