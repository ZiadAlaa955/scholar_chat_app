import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat_app/Helper/snackBar.dart';
import 'package:scholar_chat_app/Views/chat_view.dart';
import 'package:scholar_chat_app/Views/sign_up_view.dart';
import 'package:scholar_chat_app/Widgets/custom_button.dart';
import 'package:scholar_chat_app/Widgets/custom_text_field.dart';
import 'package:scholar_chat_app/constants.dart';
import 'package:scholar_chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat_app/cubits/hide_password_cubit/hide_password_cubit.dart';
import 'package:scholar_chat_app/cubits/signin_cubit/signin_cubit.dart';

class SignInView extends StatelessWidget {
  static String id = 'siginView';
  String? email, password;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool showPassword = true;
  bool passwordObsecure = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          isLoading = false;
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushNamed(context, ChatView.id, arguments: email);
        } else if (state is LoginFaliure) {
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
                    BlocConsumer<HidePasswordCubit, HidePasswordState>(
                      listener: (context, state) {
                        if (state is HidePassword) {
                          showPassword = false;
                          passwordObsecure = true;
                        } else if (state is ShowPassword) {
                          showPassword = true;
                          passwordObsecure = false;
                        }
                      },
                      builder: (context, state) {
                        return CustomTextFormField(
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: IconButton(
                              onPressed: () {
                                BlocProvider.of<HidePasswordCubit>(context)
                                    .showHidePassword(
                                  showPassword: showPassword,
                                  passwordObsecure: passwordObsecure,
                                );
                              },
                              icon: showPassword == true
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
                          obscureText: passwordObsecure,
                          onChanged: (value) {
                            password = value;
                          },
                          hint: 'Password',
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: 'Sign In',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context).logIn(
                            email: email!,
                            password: password!,
                          );
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
        ),
      ),
    );
  }
}
