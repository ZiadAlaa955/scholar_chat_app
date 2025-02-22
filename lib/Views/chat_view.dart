import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat_app/Models/message_model.dart';
import 'package:scholar_chat_app/Widgets/message_bubble.dart';
import 'package:scholar_chat_app/Widgets/message_bubble_for_friend.dart';
import 'package:scholar_chat_app/constants.dart';
import 'package:scholar_chat_app/cubits/chat_cubit/chat_cubit.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key, required this.email});

  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();
  final String email;
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
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          List<MessageModel> messagesList =
              BlocProvider.of<ChatCubit>(context).messagesList;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  reverse: true,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    if (messagesList[index].email == email) {
                      return MessageBubble(
                        messageModel: messagesList[index],
                      );
                    } else {
                      return MessageBubbleForFriend(
                        messageModel: messagesList[index],
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: TextField(
                  controller: textController,
                  onSubmitted: (value) {
                    BlocProvider.of<ChatCubit>(context).sendMessage(
                      message: value,
                      email: email,
                    );
                    textController.clear();
                    scrollController.jumpTo(
                      scrollController.position.minScrollExtent,
                    );
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        BlocProvider.of<ChatCubit>(context).sendMessage(
                          message: textController.text,
                          email: email,
                        );
                        textController.clear();
                        scrollController.jumpTo(
                          scrollController.position.minScrollExtent,
                        );
                      },
                      icon: Icon(
                        Icons.send,
                        size: 30,
                        color: kPrimaryColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
