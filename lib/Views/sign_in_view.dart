import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat_app/Helper/snackBar.dart';
import 'package:scholar_chat_app/Widgets/custom_button.dart';
import 'package:scholar_chat_app/Widgets/custom_text_field.dart';
import 'package:scholar_chat_app/Widgets/password_icon.dart';
import 'package:scholar_chat_app/Widgets/signup_navigation_text.dart';
import 'package:scholar_chat_app/app_routes.dart';
import 'package:scholar_chat_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:scholar_chat_app/constants.dart';
import 'package:scholar_chat_app/cubits/chat_cubit/chat_cubit.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  String? email, password;

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SigninLoading) {
          isLoading = true;
        } else if (state is SigninSuccess) {
          isLoading = false;
          BlocProvider.of<ChatCubit>(context).getMessages();
          GoRouter.of(context).push(chat, extra: email);
        } else if (state is SigninFaliure) {
          isLoading = false;
          snackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) => ModalProgressHUD(
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
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      hint: 'Email',
                      obscureText: false,
                      onChanged: (value) {
                        email = value;
                      },
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
                      text: 'Sign In',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(
                            SignInEvent(
                              email: email!,
                              password: password!,
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    const SignUpNavigationText(),
                    const SizedBox(height: 120),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
