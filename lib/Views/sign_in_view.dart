import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:scholar_chat_app/Views/sign_up_view.dart';
import 'package:scholar_chat_app/Widgets/custom_button.dart';
import 'package:scholar_chat_app/Widgets/custom_text_field.dart';
import 'package:scholar_chat_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});
  static String id = 'siginView';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
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
                CustomTextField(
                  onChanged: (value) {
                    email = value;
                  },
                  hint: 'Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (value) {
                    password = value;
                  },
                  hint: 'Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'Sign In',
                  onTap: () async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        log('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        log('Wrong password provided for that user.');
                      }
                    }
                  },
                ),
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
                      onTap: () {
                        Navigator.pushNamed(context, SignUpView.id);
                      },
                      child: const Text(
                        '  Sign Up',
                        style: TextStyle(
                          color: Color(0xffC5E8E8),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
