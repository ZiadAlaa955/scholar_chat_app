import 'package:flutter/material.dart';
import 'package:scholar_chat_app/Widgets/message_bubble.dart';
import 'package:scholar_chat_app/constants.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  static String id = 'chatView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 60,
            ),
            const Text(
              'Chat',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: const MessageBubble(),
    );
  }
}
