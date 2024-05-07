import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hot_toast/flutter_hot_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:reminderapp/repository/auth_api_service.dart';
import 'package:reminderapp/repository/user_auth_repo.dart';
import 'package:reminderapp/routes/routes.dart';
import 'package:reminderapp/routes/routes_name.dart';
import 'package:reminderapp/splash_screen.dart';
import 'package:reminderapp/viewmodels/auth_view_model.dart';
import 'package:reminderapp/viewmodels/home_view_model.dart';
import 'package:reminderapp/viewmodels/userlogin_viewmodel.dart';
import 'package:lottie/lottie.dart';



void main() {
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // // Provide the LoginViewModel with LoginViewModel dependency to manage user data and API calls
        // ChangeNotifierProvider<LoginViewModel>(
        //   create: (context) => LoginViewModel(authapiService: apiService),
        // ),
         ChangeNotifierProvider(create: (_)=> AuthViewModel()),
         ChangeNotifierProvider(create: (_)=> HomeViewModel()),
        
      ],
      child: GlobalLoaderOverlay(
        child: MaterialApp(
          builder: FToastBuilder(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Poppins'),
          home: const SplashScreen(),
          initialRoute: RoutesName.login,
          onGenerateRoute: Routes.generateRoute,
        ),
      ),
    );
  }
}
