import 'package:flutter/material.dart';
import 'package:kopiness/features/auth/service/auth_service.dart';
import 'package:kopiness/features/auth/store/auth_store.dart';
import 'package:kopiness/features/dashboard/pages/dashboard_page.dart';
import 'package:kopiness/shared/widgets/app_text_field.dart';
import 'package:kopiness/shared/widgets/app_button.dart';
import 'package:kopiness/shared/theme/app_colors.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final email = emailController.text;
    final password = passwordController.text;

    final result = await AuthService().login(email, password);

    if (result != null && result.isLoggedIn) {
      await context.read<AuthStore>().login(result.data);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardPage()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login gagal')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 420, // biar ga kegedean di tablet / web
                ),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 24), // jarak atas manual
                        const Text(
                          'Kopiness',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 24),

                        AppTextField(
                          label: 'Email',
                          required: true,
                          controller: emailController,
                          validator: (v) => v == null || v.isEmpty
                              ? 'Email wajib diisi'
                              : null,
                        ),
                        const SizedBox(height: 16),

                        AppTextField(
                          label: 'Password',
                          required: true,
                          controller: passwordController,
                          isPassword: true,
                          validator: (v) => v == null || v.length < 6
                              ? 'Min 6 karakter'
                              : null,
                        ),
                        const SizedBox(height: 24),

                        AppButton(label: 'Login', onPressed: _submit),

                        const SizedBox(height: 16),
                        Text.rich(
                          TextSpan(
                            text: 'Belum punya akun ? ',
                            children: [
                              TextSpan(
                                text: 'Register',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(color: Colors.grey, thickness: 1),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                'OR',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            const Expanded(
                              child: Divider(color: Colors.grey, thickness: 1),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: Image.network(
                            'https://developers.google.com/identity/images/g-logo.png',
                            width: 18,
                          ),
                          label: const Text('Sign up with Google'),
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                            side: BorderSide(color: AppColors.primary),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
