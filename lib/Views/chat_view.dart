import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat_app/Models/message_model.dart';
import 'package:scholar_chat_app/Widgets/message_bubble.dart';
import 'package:scholar_chat_app/Widgets/message_bubble_for_friend.dart';
import 'package:scholar_chat_app/constants.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static String id = 'chatView';
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('created at', descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(
              MessageModel.fromJson(
                snapshot.data!.docs[i],
              ),
            );
          }

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
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: scrollController,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      if (messageList[index].email == email) {
                        return MessageBubble(
                          message: messageList[index],
                        );
                      } else {
                        return MessageBubbleForFriend(
                          message: messageList[index],
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
                      messages.add(
                        {
                          'message': value,
                          'email': email,
                          'created at': DateTime.now(),
                        },
                      );
                      textController.clear();
                      scrollController.jumpTo(
                        scrollController.position.minScrollExtent,
                      );
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.send,
                        size: 30,
                        color: kPrimaryColor,
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
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
