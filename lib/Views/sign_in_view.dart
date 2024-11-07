import 'package:flutter/material.dart';
import 'package:scholar_chat_app/Widgets/custom_button.dart';
import 'package:scholar_chat_app/Widgets/custom_text_field.dart';
import 'package:scholar_chat_app/constants.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static String id = 'siginView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(
                height: 75,
              ),
              Image.asset(
                kLogo,
                height: 100,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Scholar Chat',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 75,
              ),
              const Row(
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextField(
                hint: 'Email',
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextField(
                hint: 'Password',
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomButton(text: 'Sign In'),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account ?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      '  Sign Up',
                      style: TextStyle(
                        color: Color(0xffC5E8E8),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
