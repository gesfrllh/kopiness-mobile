import 'package:flutter/material.dart';
import 'bootstrap/app_initializer.dart';
import 'package:kopiness/app/app_root.dart';
import 'package:kopiness/features/auth/store/auth_store.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.init();
  final authStore = AuthStore();
  await authStore.restoreLogin();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthStore())],
      child: const AppRoot(),
    ),
  );
}
