import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat_app/Models/message_model.dart';
import 'package:scholar_chat_app/Widgets/message_bubble.dart';
import 'package:scholar_chat_app/Widgets/message_bubble_for_friend.dart';
import 'package:scholar_chat_app/constants.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static String id = 'chatView';

  final CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;

    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(
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
                      sendMessage(value, email);
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          sendMessage(textController.text, email);
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

  void sendMessage(String value, String email) {
    messages.add({
      kMessage: value, // John Doe
      kEmail: email, // Stokes and Sons
      kCreatedAt: DateTime.now(), // ,42
    });
    textController.clear();
    scrollController.jumpTo(
      scrollController.position.minScrollExtent,
    );
  }
}
