import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.onChanged,
    required this.obscureText,
  });

  final String hint;
  final bool obscureText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
        }
      },
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
    );
  }
}
