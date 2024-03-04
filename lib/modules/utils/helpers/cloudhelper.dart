import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../views/home/model/chatModel.dart';
import 'authhelper.dart';

class CloudFireStoreHelper {
  CloudFireStoreHelper._();

  static final CloudFireStoreHelper fireStoreHelper = CloudFireStoreHelper._();

  static final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<void> addUser() async {
    await fireStore
        .collection("users")
        .doc(RegisterHelper.firebaseAuth.currentUser?.uid)
        .set({
      'name': (RegisterHelper.firebaseAuth.currentUser?.displayName == null)
          ? "${RegisterHelper.firebaseAuth.currentUser?.email?.split("@")[0].capitalizeFirst}"
          : "${RegisterHelper.firebaseAuth.currentUser?.displayName}",
      'email': RegisterHelper.firebaseAuth.currentUser?.email,
      'uid': RegisterHelper.firebaseAuth.currentUser?.uid,
      'profile_picture':
          (RegisterHelper.firebaseAuth.currentUser?.photoURL == null)
              ? "https://www.color-hex.com/palettes/6355.png"
              : "${RegisterHelper.firebaseAuth.currentUser?.photoURL}",
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchUser() {
    return fireStore
        .collection('users')
        .where('uid',
            isNotEqualTo: RegisterHelper.firebaseAuth.currentUser?.uid)
        .snapshots();
  }

  Future<void> sendMessage({required Chat chatInstance}) async {
    //todo:my current user
    String u1 = chatInstance.sender;
    String u2 = chatInstance.receiver;
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await fireStore.collection('chats').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> fetchedChatID =
        querySnapshot.docs;
    bool isChatRoomAvailable = false;
    String fetchedUser1 = '';
    String fetchedUser2 = '';
    for (QueryDocumentSnapshot element in fetchedChatID) {
      String user1 = element.id.split('_')[0];
      String user2 = element.id.split('_')[1];
      if ((user1 == u1 || user1 == u2) && (user2 == u1 || user2 == u2)) {
        isChatRoomAvailable = true;
        fetchedUser1 = element.id.split('_')[0];
        fetchedUser2 = element.id.split('_')[1];
      }
    }
    if (isChatRoomAvailable == true) {
      log("CHAT ROOM IS AVAILABLE");
      await fireStore
          .collection("chats")
          .doc("${fetchedUser1}_$fetchedUser2")
          .collection("messages")
          .add({
        "sender": chatInstance.sender,
        "receiver": chatInstance.receiver,
        "message": chatInstance.message,
        "timestamp": FieldValue.serverTimestamp(),
      });
    } else {
      log("CHAT ROOM IS NOT AVAILABLE");
      await fireStore
          .collection("chats")
          .doc("${chatInstance.receiver}_${chatInstance.sender}")
          .set({
        "sender": chatInstance.sender,
        "receiver": chatInstance.receiver,
      });

      await fireStore
          .collection("chats")
          .doc("${chatInstance.receiver}_${chatInstance.sender}")
          .collection("messages")
          .add({
        "sender": chatInstance.sender,
        "receiver": chatInstance.receiver,
        "message": chatInstance.message,
        "timestamp": FieldValue.serverTimestamp(),
      });
    }
  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> fetchMessage(
      {required Chat chatInstance}) async {
    //todo:my current user
    String u1 = chatInstance.sender;
    String u2 = chatInstance.receiver;
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await fireStore.collection('chats').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> fetchedChatID =
        querySnapshot.docs;
    bool isChatRoomAvailable = false;
    String fetchedUser1 = '';
    String fetchedUser2 = '';
    for (QueryDocumentSnapshot element in fetchedChatID) {
      String user1 = element.id.split('_')[0];
      String user2 = element.id.split('_')[1];
      if ((user1 == u1 || user1 == u2) && (user2 == u1 || user2 == u2)) {
        isChatRoomAvailable = true;
        fetchedUser1 = element.id.split('_')[0];
        fetchedUser2 = element.id.split('_')[1];
      }
    }
    if (isChatRoomAvailable == true) {
      log("CHAT ROOM IS AVAILABLE");
      return fireStore
          .collection("chats")
          .doc("${fetchedUser1}_$fetchedUser2")
          .collection("messages")
          .orderBy('timestamp', descending: true)
          .snapshots();
    } else {
      log("CHAT ROOM IS NOT AVAILABLE");
      await fireStore
          .collection("chats")
          .doc("${chatInstance.receiver}_${chatInstance.sender}")
          .set({
        "sender": chatInstance.sender,
        "receiver": chatInstance.receiver,
      });

      return fireStore
          .collection("chats")
          .doc("${chatInstance.receiver}_${chatInstance.sender}")
          .collection("messages")
          .orderBy('timestamp', descending: true)
          .snapshots();
    }
  }
}
