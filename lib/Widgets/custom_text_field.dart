import 'package:flutter/material.dart';
import 'package:scholar_chat_app/Utils/helper.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.onChanged,
    required this.obscureText,
    this.icon,
  });

  final String hint;
  final bool obscureText;
  final void Function(String)? onChanged;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        hintStyle: const TextStyle(color: Colors.white),
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
      ),
    );
  }
}
