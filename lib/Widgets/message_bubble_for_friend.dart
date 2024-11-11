import 'package:flutter/material.dart';
import 'package:scholar_chat_app/Models/message_model.dart';
import 'package:scholar_chat_app/constants.dart';

class MessageBubbleForFriend extends StatelessWidget {
  const MessageBubbleForFriend({super.key, required this.messageModel});
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xff006385),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 30,
              top: 30,
              bottom: 30,
            ),
            child: Text(
              messageModel.message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
