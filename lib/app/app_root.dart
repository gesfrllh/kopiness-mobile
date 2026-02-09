import 'package:flutter/material.dart';
import 'package:kopiness/features/auth/pages/auth/login_page.dart';
import 'package:kopiness/features/auth/store/auth_store.dart';
import 'package:provider/provider.dart';
import 'package:kopiness/features/dashboard/pages/dashboard_page.dart';

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
      onGenerateRoute: (settings) {
        /// 🔐 GUARD DASHBOARD
        if (settings.name == '/dashboard' && !authStore.isLoggedIn) {
          return MaterialPageRoute(builder: (_) => const LoginPage());
        }

        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (_) => authStore.isLoggedIn
                  ? const DashboardPage()
                  : const LoginPage(),
            );

          case '/login':
            return MaterialPageRoute(builder: (_) => const LoginPage());

          case '/dashboard':
            return MaterialPageRoute(builder: (_) => const DashboardPage());

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
