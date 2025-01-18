// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
//
// // import 'package:DYNT/core/db/app_db.dart';
// // import 'package:DYNT/main.dart';
// // import 'package:DYNT/models/response/user/user_profile_response.dart';
// // import 'package:DYNT/pages/common/firebase_chat_manager/constants/firebase_collection_enum.dart';
// // import 'package:DYNT/pages/common/firebase_chat_manager/constants/firestore_constants.dart';
// // import 'package:DYNT/pages/common/firebase_chat_manager/models/chat_message.dart';
// // import 'package:DYNT/pages/common/firebase_chat_manager/models/firebase_chat_user.dart';
// // import 'package:DYNT/pages/home/notification/controller/notification_controller.dart';
// // import 'package:DYNT/utils/date_time_helper.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:splinder/data/model/request/personal_chat/chat_message_req_model.dart';
//
// import '../data/model/request/personal_chat/firebase_chat_user.dart';
// import '../util/firebase_collection_enum.dart';
// import '../util/firestore_constants.dart';
//
// class FirebaseChatManager {
//   /// Logout User
//   Future<void> logoutUser() async {
//     await FirebaseAuth.instance.signOut();
//   }
//
//   Future<User?> firebaseUserLogin(FirebaseChatUser user) async {
//     try {
//       if (FirebaseAuth.instance.currentUser != null) {
//         // Check is already sign up
//         final QuerySnapshot result = await FirebaseFirestore.instance
//             .collection(FirebaseCollection.users.name)
//             .where(FirestoreConstants.userId, isEqualTo: user.userId.toString())
//             .get();
//
//         final List<DocumentSnapshot> documents = result.docs;
//
//         if (documents.isEmpty) {
//           // Update data to server if new user
//           FirebaseFirestore.instance
//               .collection(FirebaseCollection.users.name)
//               .doc(user.userId.toString())
//               .set(user.toJson());
//
//           return Future.value(FirebaseAuth.instance.currentUser);
//         } else {
//           return Future.value(FirebaseAuth.instance.currentUser);
//         }
//       } else {
//         debugPrint('User Found Returning user');
//         return Future.error('');
//       }
//     } on FirebaseAuthException catch (e) {
//       debugPrint('Firebase No User Found $e');
//
//       ///SignUp the user into firebase
//       return await firebaseUserSignup(user);
//     }
//   }
//
//   Future<User?> firebaseUserSignup(FirebaseChatUser user) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: user.userEmail ?? '', password: "123");
//
//       debugPrint('### - Creating User ${user.toJson()}');
//
//       FirebaseFirestore.instance
//           .collection(FirebaseCollection.users.name)
//           .doc(user.userId.toString())
//           .set(user.toJson());
//
//       return Future.value(userCredential.user);
//     } on FirebaseAuthException catch (e) {
//       debugPrint('Firebase No User Found $e');
//     }
//   }
//
//   Stream<QuerySnapshot> getChatStream(String groupChatId, int limit) {
//     return FirebaseFirestore.instance
//         .collection(FirebaseCollection.chat.name)
//         .doc(groupChatId)
//         .collection(groupChatId)
//         .orderBy(FirestoreConstants.createdAt, descending: true)
//         // .limit(limit)
//         .snapshots();
//   }
//
//   Future<void> sendMessage(
//     ChatMessageRequestModel messageChat,
//     String deviceToken,
//     String notificationTitle,
//   ) async {
//     debugPrint('#### sendMessage ######');
//     debugPrint('## content = ${messageChat.text}');
//     debugPrint('## type = ${messageChat.messageType}');
//     debugPrint('## receiverId = ${messageChat.receiverId}');
//     debugPrint('## title = $notificationTitle');
//
//     var documentReference = FirebaseFirestore.instance
//         .collection(FirebaseCollection.chat.name)
//         .doc(messageChat.chatId)
//         .collection(messageChat.chatId ?? '')
//         .doc(DateTime.now().millisecondsSinceEpoch.toString());
//
//     debugPrint("Message chat content: ${messageChat.text}");
//     debugPrint("Message chat type: ${messageChat.messageType}");
//     debugPrint("Message chat receiverId: ${messageChat.receiverId}");
//     debugPrint("Message chat title: ${messageChat.title}");
//
//     documentReference.set(messageChat.toJson()).then((value) async {
//       try {
//         await sendPushNotification(messageChat, notificationTitle, deviceToken);
//       } catch (e) {
//         debugPrint('Error during sendPushNotification: $e');
//       }
//     });
//   }
//
//   static Future<void> sendPushNotification(
//     ChatMessageRequestModel chatUser,
//     String? notificationTitle,
//     String? deviceToken,
//   ) async {
//     try {
//       debugPrint("sendPushNotification called");
//
//       final body = {
//         "to": deviceToken,
//         "notification": {
//           "title": notificationTitle,
//           "body": chatUser.messageType != 'image'
//               ? chatUser.text.toString()
//               : '📷 Image',
//         },
//       };
//
//       debugPrint("Send Notification body $body");
//       debugPrint('Before making the HTTP request');
//
//       var res = await post(
//         Uri.parse('https://fcm.googleapis.com/fcm/send'),
//         headers: {
//           HttpHeaders.contentTypeHeader: 'application/json',
//           HttpHeaders.authorizationHeader:
//               'key=AAAAZS1OFgM:APA91bE5_wBjJMCL99YCsoJgFPtti80TY2Cey2hfpjpPoqH-pCEc66kGtTdDFctaK9-QlWBimft5ruR_dHyH0xI9ZaP6Ksu1sgrCbTO_9s44hjezg2HRohb-FqOKRTg4a8nQCquVyFjn',
//         },
//         body: jsonEncode(body),
//       );
//
//       log('Response status: ${res.statusCode}');
//       log('Response body: ${res.body}');
//     } catch (e) {
//       log('\nsendPushNotificationE: $e');
//     }
//   }
//
//   UploadTask uploadFile(File image, String fileName) {
//     Reference reference = FirebaseStorage.instance.ref().child(fileName);
//     UploadTask uploadTask = reference.putFile(image);
//     return uploadTask;
//   }
// }
