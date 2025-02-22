import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat_app/Utils/app_routes.dart';
import 'package:scholar_chat_app/cubits/signin_cubit/signin_cubit.dart';
import 'package:scholar_chat_app/cubits/signup_cubit/auth_cubit.dart';
import 'package:scholar_chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat_app/Utils/helper.dart';
import 'package:scholar_chat_app/Utils/simple_bloc_observer.dart';

void main() async {
  await initializeFirebae();
  Bloc.observer = SimpleBlocObserver();
  runApp(const ScholarChatApp());
}

class ScholarChatApp extends StatelessWidget {
  const ScholarChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignupCubit()),
        BlocProvider(create: (context) => SigninCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
