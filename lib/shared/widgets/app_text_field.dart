import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppTextField extends StatefulWidget {
  final String label;
  final bool required;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.label,
    required this.controller,
    this.required = false,
    this.isPassword = false,
    this.validator,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _obscure : false,
          validator: widget.validator,
          decoration: InputDecoration(
            label: Text.rich(
              TextSpan(
                text: widget.label,
                style: widget.required
                    ? TextStyle(color: Colors.black)
                    : TextStyle(color: Colors.red),
                children: widget.required
                    ? const [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(color: Colors.red),
                        ),
                      ]
                    : [],
              ),
            ),
            // hintText: widget,
            border: const OutlineInputBorder(),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                    icon: Icon(
                      _obscure ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
