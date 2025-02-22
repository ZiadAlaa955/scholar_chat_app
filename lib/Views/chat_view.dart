import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat_app/Models/message_model.dart';
import 'package:scholar_chat_app/Widgets/chat_app_bar_title.dart';
import 'package:scholar_chat_app/Widgets/message_bubble.dart';
import 'package:scholar_chat_app/Widgets/message_bubble_for_friend.dart';
import 'package:scholar_chat_app/Utils/constants.dart';
import 'package:scholar_chat_app/cubits/chat_cubit/chat_cubit.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key, required this.email});

  final String email;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: const ChatAppBarTitle(),
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
                    if (messagesList[index].email == widget.email) {
                      return MessageBubble(messageModel: messagesList[index]);
                    } else {
                      return MessageBubbleForFriend(
                          messageModel: messagesList[index]);
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
                      email: widget.email,
                    );
                    textController.clear();
                    scrollController
                        .jumpTo(scrollController.position.minScrollExtent);
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        BlocProvider.of<ChatCubit>(context).sendMessage(
                          message: textController.text,
                          email: widget.email,
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
