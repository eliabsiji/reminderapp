import 'package:dio/dio.dart';
import 'package:reminderapp/helper/constants.dart';

class AuthApiService {
  late Dio _dio; // Dio instance to perform HTTP requests.

  // ApiService({required Dio dio}) : _dio = dio;
  AuthApiService({required Dio dio}) {
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: const Duration(seconds:5),
      receiveTimeout: const Duration(seconds: 3),
      responseType: ResponseType.json,
    ))
      ..interceptors.addAll([
        // LoggerInterceptor(), //custom logger interceptor.
      ]);
  }

 

  Future<String?> loginUser(Map<dynamic, dynamic> req) async {
    try {
      final response =
          // ignore: prefer_interpolation_to_compose_strings
          await _dio.post(BASE_URL + "login/", data: req);
        if (response.statusCode == 200) {
        // Success
        //return response.data['token'];
        // Check if 'token' key exists in the response data
        if (response.data.containsKey('token')) {
          return response.data['token'];
        }
        // If 'error' key doesn't exist, return a generic error message
        return 'An error occurred';
      } else {
        // Handle other status codes as needed
        return 'Failed to login';
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