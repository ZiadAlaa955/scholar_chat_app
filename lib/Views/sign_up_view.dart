import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat_app/Helper/snackBar.dart';
import 'package:scholar_chat_app/Widgets/custom_button.dart';
import 'package:scholar_chat_app/Widgets/custom_text_field.dart';
import 'package:scholar_chat_app/Widgets/password_icon.dart';
import 'package:scholar_chat_app/Widgets/signin_navigation_text.dart';
import 'package:scholar_chat_app/app_routes.dart';
import 'package:scholar_chat_app/constants.dart';
import 'package:scholar_chat_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:scholar_chat_app/cubits/chat_cubit/chat_cubit.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? email, password;

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          isLoading = true;
        } else if (state is SignupSuccess) {
          isLoading = false;
          BlocProvider.of<ChatCubit>(context).getMessages();
          GoRouter.of(context).push(chat, extra: email);
        } else if (state is SignupFaliure) {
          isLoading = false;
          snackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 75),
                      Image.asset(kLogo, height: 100),
                      const Text(
                        'Scholar Chat',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                      const SizedBox(height: 75),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        obscureText: false,
                        onChanged: (value) {
                          email = value;
                        },
                        hint: 'Email',
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        hint: 'Password',
                        obscureText: isPasswordVisible,
                        onChanged: (value) {
                          password = value;
                        },
                        icon: IconButton(
                          padding: const EdgeInsets.only(right: 8),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          icon: isPasswordVisible
                              ? const PasswordIcon(
                                  icon: FontAwesomeIcons.eyeSlash)
                              : const PasswordIcon(icon: FontAwesomeIcons.eye),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'Sign Up',
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context)
                                .signUp(email: email!, password: password!);
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      const SignInNavigationText(),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
