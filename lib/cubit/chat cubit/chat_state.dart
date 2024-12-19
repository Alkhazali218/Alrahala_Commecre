

import 'package:alrahala_commecre/core/utils/model/message_model/message_model.dart';

abstract  class ChatState {}

// ignore: camel_case_types
class chatInitial extends ChatState{}
// ignore: camel_case_types
class chatLoading extends ChatState{}
// ignore: camel_case_types
class chatSucess extends ChatState{
List<MessageModel> messages = [];
chatSucess({required this.messages});
}