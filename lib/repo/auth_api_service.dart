import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:reminderapp/helper/app_status.dart';
import 'package:reminderapp/helper/constants.dart';
import 'package:reminderapp/models/userlogin/user_login_success.dart';

class AuthApiService {
  late Dio _dio; // Dio instance to perform HTTP requests.

  // ApiService({required Dio dio}) : _dio = dio;
  AuthApiService({required Dio dio}) {
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      responseType: ResponseType.json,
    ))
      ..interceptors.addAll([
        // LoggerInterceptor(), //custom logger interceptor.
      ]);
  }

  Future<dynamic> loginUser(Map<dynamic, dynamic> req) async {
    try {
      String jsondata = json.encode(req);
      final response =
          // ignore: prefer_interpolation_to_compose_strings
          await _dio.post(BASE_URL + "login/", data: jsondata);
      if (response.statusCode == 200) {
        // Success
        return AuthSuccess(response:UserLoginSuccessl.fromJson(response.data));
      } else if (response.statusCode == 400) {
        // Handle other status codes as needed
        return response.data;
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null &&
            e.response!.data != null &&
            e.response!.data['error'] != null) {
          final errorMessage = e.response!.data['error'];
          print('Error Message: $errorMessage');
          return errorMessage;
        }
      }
      // Handle other errors or exceptions
      print('Error: $e');
      return null;
    }
  }
}
