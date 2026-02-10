import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF8B4513); // kopi vibes
  static const border = Color(0xFFD0D5DD);
  static const textGrey = Color(0xFF667085);
  static const disabled = Color(0xFFB0B5BD);
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Clean App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Login Page')),
        body: Center(
          child: ElevatedButton(onPressed: () {}, child: const Text('Button')),
        ),
      ),
      theme: ThemeData(
        // ignore: deprecated_member_us
        // primaryColor: Colors.grey.withOpacity(0.5),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary)
            .copyWith(
              primary: AppColors.primary,
              secondary: AppColors.primary, // optional
            ),
      ),
    );
  }
}
