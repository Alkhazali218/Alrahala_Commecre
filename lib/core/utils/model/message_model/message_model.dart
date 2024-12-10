import 'package:alrahala_commecre/core/utils/helper/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String userId;
  final String message;
  final DateTime createdAt;

  MessageModel({required this.userId, required this.message, required this.createdAt});

  factory MessageModel.fromJson( json) {
    return MessageModel(
      userId: json[KUserId],
      message: json[kMessage],
      createdAt: (json[kCreatedAt] as Timestamp).toDate(), // Ensure correct conversion
    );
  }
}