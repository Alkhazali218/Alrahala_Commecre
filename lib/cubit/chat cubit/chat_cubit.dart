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

  // إضافة الرسالة إلى Firestore وإرسال الإشعار عبر Cloud Function
  void sendMessage({
    required String data,
    required String email,
  }) {
    try {
      message.add({
        kMessage: data,
        kCreatedAt: DateTime.now(),
        KUserId: email,
      });
    // ignore: unused_catch_clause
    } on Exception catch (e) {
      // TODO
    }
  }

  void getMessage() {
    message.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messageList.clear();
      for (var doc in event.docs) {
        messageList.add(MessageModel.fromJson(doc));
      }
      // ترتيب الرسائل بعد إضافتها، حتى لو كانت قاعدة البيانات مرتبة
      messageList.sort((a, b) => b.createdAt
          .compareTo(a.createdAt)); // تأكد من أن لديك خاصية createdAt
      emit(chatSucess(messages: List.from(messageList)));
    });
  }
}
