import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat_app/Views/chat_view.dart';
import 'package:scholar_chat_app/Views/sign_in_view.dart';
import 'package:scholar_chat_app/Widgets/custom_button.dart';
import 'package:scholar_chat_app/Widgets/custom_text_field.dart';
import 'package:scholar_chat_app/constants.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static String id = 'signupView';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? email, password;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  bool showpassword = true;
  bool passowrdObsecure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formKey,
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
                          'Sign Up',
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
                    CustomTextFormField(
                      obscureText: false,
                      onChanged: (value) {
                        email = value;
                      },
                      hint: 'Email',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: IconButton(
                          onPressed: () {
                            if (showpassword == true) {
                              showpassword = false;
                              passowrdObsecure = true;
                            } else if (showpassword == false) {
                              showpassword = true;
                              passowrdObsecure = false;
                            }
                            setState(() {});
                          },
                          icon: showpassword == true
                              ? const Icon(
                                  FontAwesomeIcons.eye,
                                  color: Colors.black54,
                                  size: 25,
                                )
                              : const Icon(
                                  FontAwesomeIcons.eyeSlash,
                                  color: Colors.black54,
                                  size: 25,
                                ),
                        ),
                      ),
                      obscureText: passowrdObsecure,
                      onChanged: (value) {
                        password = value;
                      },
                      hint: 'Password',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: 'Sign Up',
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        if (formKey.currentState!.validate()) {
                          try {
                            await signUp();
                            Navigator.pushNamed(context, ChatView.id,
                                arguments: email);
                          } on FirebaseAuthException catch (e) {
                            if (e.code.toString() == 'weak-password') {
                              snackBar(context, 'The password is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              snackBar(context, 'The account already exists');
                            } else {
                              snackBar(context, e.toString());
                            }
                          } on Exception catch (e) {
                            snackBar(context, e.toString());
                          }
                        }
                        setState(() {
                          isLoading = false;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account ?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            '  Sign In',
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
        ),
      ),
    );
  }

  Future<void> signUp() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
