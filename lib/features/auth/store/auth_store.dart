import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthStore extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  Map<String, dynamic>? _data;
  Map<String, dynamic>? get data => _data;

  Future<void> login(Map<String, dynamic> response) async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = true;
    _data = response;

    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userData', jsonEncode(response));
    notifyListeners();
  }

  Future<void> restoreLogin() async {
    final prefs = await SharedPreferences.getInstance();

    final loggedIn = prefs.getBool('isLoggedIn') ?? false;
    final userDataString = prefs.getString('userData');

    if (loggedIn && userDataString != null) {
      _isLoggedIn = true;
      _data = jsonDecode(userDataString);
    } else {
      _isLoggedIn = false;
      _data = null;
    }

    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();

    _isLoggedIn = false;
    _data = null;
    notifyListeners();
  }
}
