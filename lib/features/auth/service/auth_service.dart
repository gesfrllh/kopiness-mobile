import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl:
          'http://localhost:7243/api'
          '',
    ),
  );

  Future<bool> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return response.data['isLoggedIn'] ?? false;
      }
    } catch (err) {
      print('Login Error: ${err}');
    }
    return false;
  }
}
