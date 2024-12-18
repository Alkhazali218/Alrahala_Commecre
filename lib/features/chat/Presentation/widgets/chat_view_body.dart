import 'package:alrahala_commecre/core/utils/helper/constant.dart';
import 'package:alrahala_commecre/cubit/chat%20cubit/chat_cubit.dart';
import 'package:alrahala_commecre/cubit/chat%20cubit/chat_state.dart';
import 'package:alrahala_commecre/features/chat/Presentation/widgets/chat_buble_for_friend_item.dart';
import 'package:alrahala_commecre/features/chat/Presentation/widgets/chat_buble_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable, camel_case_types
class chatViewBody extends StatelessWidget {
  chatViewBody({super.key});
  final _controller = ScrollController();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;

    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              var messageList = BlocProvider.of<ChatCubit>(context).messageList;
              return ListView.builder(
                reverse: true,
                controller: _controller,
                itemCount: messageList.length,
                itemBuilder: (context, index) {
                  return messageList[index].id == email
                      ? chatBubleItem(message: messageList[index])
                      : chatBubleForFriendItem(message: messageList[index]);
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
            onSubmitted: (data) {
              _sendMessage(context, data, email);
            },
            decoration: InputDecoration(
              hintText: 'Send Message',
              suffixIcon: GestureDetector(
                onTap: () {
                  // عند الضغط على الأيقونة
                  _sendMessage(context, controller.text, email);
                },
                child: const Icon(
                  Icons.send,
                  color: kcolor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: kcolor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _sendMessage(BuildContext context, String data, String email) async {
    if (data.isNotEmpty) {
        BlocProvider.of<ChatCubit>(context).sendMessage(
          data: data,
          email: email,
        );
      // مسح محتوى TextField بعد الإرسال
      controller.clear();
      // تحريك الشاشة إلى أسفل بعد الإرسال
      _controller.animateTo(0,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    }
  }
}
