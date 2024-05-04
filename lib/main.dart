import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hot_toast/flutter_hot_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:reminderapp/repo/auth_api_service.dart';
import 'package:reminderapp/repo/user_auth_repo.dart';
import 'package:reminderapp/splash_screen.dart';
import 'package:reminderapp/viewmodels/userlogin_viewmodel.dart';
import 'package:lottie/lottie.dart';



void main() {
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

 // Create Dio instance for HTTP requests
  late Dio dio = Dio();

  // Create ApiService instance with the Dio instance
  late AuthApiService apiService = AuthApiService(dio: dio);

  // Create LoginRepository instance with the ApiService instance
  // late AuthRepository authRepository = AuthRepository(apiService: apiService);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provide the LoginViewModel with LoginViewModel dependency to manage user data and API calls
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(authapiService: apiService),
        ),
      ],
      child: GlobalLoaderOverlay(
        child: MaterialApp(
          builder: FToastBuilder(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Poppins'),
          home: const SplashScreen()
        ),
      ),
    );
  }
}
