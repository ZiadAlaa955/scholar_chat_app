import 'package:flutter/material.dart';
import 'package:scholar_chat_app/constants.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 30,
            top: 30,
            bottom: 30,
          ),
          child: Text(
            'Hello asdasdasdsddas ',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
