import 'package:flutter/material.dart';
import 'package:kopiness/ui/pages/login_page.dart';
import 'package:kopiness/ui/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Clean App',
      home: LoginPage(),
      theme: AppTheme.light,
    );
  }
}
