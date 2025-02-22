import 'package:flutter/material.dart';

class PasswordIcon extends StatelessWidget {
  const PasswordIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.black54,
      size: 25,
    );
  }
}
