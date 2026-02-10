import 'package:flutter/material.dart';
import 'package:kopiness/core/app_messanger.dart';
import 'package:kopiness/ui/pages/login_page.dart';
import 'package:kopiness/core/stores/auth_store.dart';
import 'package:provider/provider.dart';
import 'package:kopiness/ui/pages/main_page.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);

    return MaterialApp(
      title: 'Kopiness',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: '/',
      scaffoldMessengerKey: scaffoldMessengerKey,
      onGenerateRoute: (settings) {
        /// 🔐 GUARD DASHBOARD
        if (settings.name == '/dashboard' && !authStore.isLoggedIn) {
          return MaterialPageRoute(builder: (_) => const LoginPage());
        }

        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (_) =>
                  authStore.isLoggedIn ? const MainPage() : const LoginPage(),
            );

          case '/login':
            return MaterialPageRoute(builder: (_) => const LoginPage());

          case '/main':
            return MaterialPageRoute(builder: (_) => const MainPage());

          default:
            return MaterialPageRoute(
              builder: (_) =>
                  const Scaffold(body: Center(child: Text('Page not found'))),
            );
        }
      },
    );
  }
}
