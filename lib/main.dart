import 'package:flutter/material.dart';
import 'package:scholar_chat_app/Views/sign_in_view.dart';

void main() {
  runApp(const ScholarChatApp());
}

class ScholarChatApp extends StatelessWidget {
  const ScholarChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SignInView.id: (context) => const SignInView(),
      },
      initialRoute: SignInView.id,
    );
  }
}
