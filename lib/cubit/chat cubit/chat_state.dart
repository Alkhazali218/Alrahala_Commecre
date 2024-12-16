

import 'package:alrahala_commecre/core/utils/model/message_model/message_model.dart';

abstract  class ChatState {}

class chatInitial extends ChatState{}
class chatSucess extends ChatState{
List<MessageModel> messages = [];
chatSucess({required this.messages});
}