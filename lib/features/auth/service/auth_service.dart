import 'package:dio/dio.dart';

class LoginResult {
  final bool isLoggedIn;
  final Map<String, dynamic> data;

  LoginResult({required this.isLoggedIn, required this.data});

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};

    return LoginResult(isLoggedIn: data['isLoggedIn'] ?? false, data: data);
  }
}

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://9f31-121-100-17-195.ngrok-free.app/api',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      validateStatus: (status) => status != null && status < 500,
    ),
  );

  /// 🔥 RETURN LoginResult, BUKAN MAP
  Future<LoginResult?> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 201) {
        return LoginResult.fromJson(response.data);
      }
    } catch (err) {
      print('Login Error: $err');
    }
    return null;
  }
}
