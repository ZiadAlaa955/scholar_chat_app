import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:scholar_chat_app/Models/message_model.dart';
import 'package:scholar_chat_app/constants.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  List<MessageModel> messagesList = [];
  final CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  void sendMessage({required String message, required String email}) {
    messages.add({
      kMessage: message,
      kEmail: email,
      kCreatedAt: DateTime.now(),
    });
  }

  void getMessages() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen(
      (event) {
        messagesList.clear();
        for (var doc in event.docs) {
          messagesList.add(MessageModel.fromJson(doc));
          emit(ChatSuccess(messagesList: messagesList));
        }
      },
    );
  }
}
