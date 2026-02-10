import 'package:flutter/material.dart';
import 'package:kopiness/ui/pages/login_page.dart';
import 'package:kopiness/core/stores/auth_store.dart';
import 'package:kopiness/ui/pages/dashboard_page.dart';
import 'package:provider/provider.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final authStore = context.read<AuthStore>();
    await authStore.restoreLogin();

    if (mounted) {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authStore = context.watch<AuthStore>();

    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return authStore.isLoggedIn ? const DashboardPage() : const LoginPage();
  }
}
