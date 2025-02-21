import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat_app/Views/chat_view.dart';
import 'package:scholar_chat_app/Views/sign_in_view.dart';
import 'package:scholar_chat_app/Views/sign_up_view.dart';
import 'package:scholar_chat_app/app_routes.dart';
import 'package:scholar_chat_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:scholar_chat_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:scholar_chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat_app/cubits/hide_password_cubit/hide_password_cubit.dart';
import 'package:scholar_chat_app/helper.dart';
import 'package:scholar_chat_app/simple_bloc_observer.dart';

void main() async {
  await initializeFirebae();
  Bloc.observer = SimpleBlocObserver();
  runApp(const ScholarChatApp());
}

class ScholarChatApp extends StatelessWidget {
  const ScholarChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => HidePasswordCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
