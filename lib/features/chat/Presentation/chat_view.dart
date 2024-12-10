import 'package:alrahala_commecre/core/utils/helper/constant.dart';
import 'package:alrahala_commecre/core/utils/model/message_model/message_model.dart';
import 'package:alrahala_commecre/features/chat/Presentation/widgets/chat_buble_for_friend_item.dart';
import 'package:alrahala_commecre/features/chat/Presentation/widgets/chat_buble_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class chatView extends StatelessWidget {
  chatView({super.key});

  static String id = 'chat view';
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);

  TextEditingController controller = TextEditingController();
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messagesList = [];
            for (var i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: kcolor,
                foregroundColor: kprimaryColor,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _controller, // Attach the controller here
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].userId == email
                            ? chatBubleItem(message: messagesList[index])
                            : chatBubleForFriendItem(
                                message: messagesList[index]);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        if (data.isNotEmpty) {
                          messages.add({
                            kMessage: data,
                            kCreatedAt: DateTime.now(),
                            KUserId: email,
                          });
                          controller.clear();
                          _controller.animateTo(0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn);
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Send Message',
                        suffixIcon: Icon(Icons.send),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: kcolor),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: kcolor,
                foregroundColor: kprimaryColor,
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
