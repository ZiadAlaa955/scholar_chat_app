import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInNavigationText extends StatelessWidget {
  const SignInNavigationText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account ?',
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: const Text(
            '  Sign In',
            style: TextStyle(color: Color(0xffC5E8E8)),
          ),
        ),
      ],
    );
  }
}
