import 'package:alrahala_commecre/core/utils/helper/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String id;
  final DateTime createdAt;

  MessageModel({required this.message, required this.id, required this.createdAt});

  factory MessageModel.fromJson( jsonData) {
    return MessageModel(
      message: jsonData[kMessage],
      id: jsonData[KUserId],
      createdAt: (jsonData[kCreatedAt] as Timestamp).toDate(), // تحويل Timestamp إلى DateTime
    );
  }
}
