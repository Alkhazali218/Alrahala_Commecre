import 'package:alrahala_commecre/core/utils/helper/constant.dart';
import 'package:alrahala_commecre/core/utils/model/message_model/message_model.dart';
import 'package:alrahala_commecre/cubit/chat%20cubit/chat_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(chatInitial());
  CollectionReference message =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  List<MessageModel> messageList = [];
  void sendMessage({required String data, required String email}) {
    try {
      message.add(
        {
          kMessage: data,
          kCreatedAt: DateTime.now(),
          KUserId: email,
        },
      );
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void getMessage() {
    message.orderBy(kCreatedAt, descending: true).snapshots().listen(
      (event) {
        messageList.clear();
        for (var doc in event.docs) {
         messageList.add(MessageModel.fromJson(doc));
        }
        emit(chatSucess(
            messages: List.from(messageList))); 
      },
    );
  }
}
