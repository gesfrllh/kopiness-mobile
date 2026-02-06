import 'package:flutter/material.dart';
import 'package:kopiness/features/auth/pages/auth/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Clean App',
      home: LoginPage(),
    );
  }
}
