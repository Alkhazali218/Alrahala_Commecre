import 'package:cloud_functions/cloud_functions.dart';

// ignore: camel_case_types
class firebaseNotifications {
  Future<void> sendNotificationToUser(String token, String message) async {
    try {
      // استدعاء دالة Cloud Function لإرسال الإشعار
      final callable = FirebaseFunctions.instance.httpsCallable('sendPushNotification');
      final result = await callable.call({
        'token': token,
        'message': message,
      });

      if (result.data['success']) {
        print('Notification sent successfully!');
      } else {
        print('Error sending notification: ${result.data['error']}');
      }
    } catch (e) {
      print('Error calling Cloud Function: $e');
    }
  }
}

