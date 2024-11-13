import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat_app/Views/chat_view.dart';
import 'package:scholar_chat_app/Views/sign_in_view.dart';
import 'package:scholar_chat_app/Views/sign_up_view.dart';
import 'package:scholar_chat_app/cubits/login_cubit/login_cubit.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChatApp());
}

class ScholarChatApp extends StatelessWidget {
  const ScholarChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SignInView.id: (context) => SignInView(),
          SignUpView.id: (context) => const SignUpView(),
          ChatView.id: (context) => ChatView(),
        },
        initialRoute: SignInView.id,
      ),
    );
  }
}
