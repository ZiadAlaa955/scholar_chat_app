import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scholar_chat_app/app_routes.dart';

class SignUpNavigationText extends StatelessWidget {
  const SignUpNavigationText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account ?',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(signUp);
          },
          child: const Text(
            '  Sign Up',
            style: TextStyle(
              color: Color(0xffC5E8E8),
            ),
          ),
        ),
      ],
    );
  }
}
