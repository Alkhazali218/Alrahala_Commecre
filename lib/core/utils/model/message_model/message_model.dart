import 'package:alrahala_commecre/core/utils/helper/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String id;
  final String message;
  final DateTime createdAt;

  MessageModel({required this.id, required this.message, required this.createdAt});

  // تحويل البيانات من JSON إلى MessageModel
  factory MessageModel.fromJson(DataJson) {
    return MessageModel(
      id: DataJson[KUserId],
      message: DataJson[kMessage],
      createdAt: (DataJson[kCreatedAt] as Timestamp).toDate(), // تأكد من تحويل `createdAt` بشكل صحيح
    );
  }
}