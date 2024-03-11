import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../views/home/model/chatModel.dart';
import 'authHelper.dart';

class CloudFireStoreHelper {
  CloudFireStoreHelper._();

  static final CloudFireStoreHelper fireStoreHelper = CloudFireStoreHelper._();

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<void> addUser() async {
    await fireStore
        .collection("users")
        .doc(AuthHelper.auth.currentUser?.uid)
        .set(
      {
        'name': (AuthHelper.auth.currentUser?.displayName == null)
            ? "${AuthHelper.auth.currentUser?.email?.split("@")[0].capitalizeFirst}"
            : "${AuthHelper.auth.currentUser?.displayName}",
        'email': AuthHelper.auth.currentUser?.email,
        'uid': AuthHelper.auth.currentUser?.uid,
        'profile_picture': (AuthHelper.auth.currentUser?.photoURL == null)
            ? "null"
            : "${AuthHelper.auth.currentUser?.photoURL}",
      },
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchUser() {
    return fireStore
        .collection('users')
        .where('uid', isNotEqualTo: AuthHelper.auth.currentUser?.uid)
        .snapshots();
  }

  Future<void> sendMessage({required Chat chatDetails}) async {
    //todo:my current user
    String u1 = chatDetails.sender;
    String u2 = chatDetails.receiver;
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
        "sender": chatDetails.sender,
        "receiver": chatDetails.receiver,
        "message": chatDetails.message,
        "timestamp": FieldValue.serverTimestamp(),
      });
    } else {
      log("CHAT ROOM IS NOT AVAILABLE");
      await fireStore
          .collection("chats")
          .doc("${chatDetails.receiver}_${chatDetails.sender}")
          .set({
        "sender": chatDetails.sender,
        "receiver": chatDetails.receiver,
      });

      await fireStore
          .collection("chats")
          .doc("${chatDetails.receiver}_${chatDetails.sender}")
          .collection("messages")
          .add({
        "sender": chatDetails.sender,
        "receiver": chatDetails.receiver,
        "message": chatDetails.message,
        "timestamp": FieldValue.serverTimestamp(),
      });
    }
  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> fetchMessage(
      {required Chat chatDetails}) async {
    //todo:my current user
    String u1 = chatDetails.sender;
    String u2 = chatDetails.receiver;
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
          .doc("${chatDetails.receiver}_${chatDetails.sender}")
          .set({
        "sender": chatDetails.sender,
        "receiver": chatDetails.receiver,
      });

      return fireStore
          .collection("chats")
          .doc("${chatDetails.receiver}_${chatDetails.sender}")
          .collection("messages")
          .orderBy('timestamp', descending: true)
          .snapshots();
    }
  }
}
