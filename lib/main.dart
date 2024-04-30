import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reminderapp/api/auth_api_service.dart';
import 'package:reminderapp/repo/user_auth_repo.dart';
import 'package:reminderapp/splash_screen.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

 // Create Dio instance for HTTP requests
  final Dio dio = Dio();

  // Create ApiService instance with the Dio instance
  final AuthApiService apiService = AuthApiService(dio: dio);

  // Create LoginRepository instance with the ApiService instance
  final AuthRepository loginRepository = AuthRepository(apiService: apiService);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const SplashScreen()
    );
  }
}
