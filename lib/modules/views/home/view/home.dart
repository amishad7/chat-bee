import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/modules/utils/globals/globals.dart';
import 'package:firebase_project/modules/utils/helpers/authHelper.dart';
import 'package:firebase_project/modules/views/intro/view/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../utils/helpers/cloudHelper.dart';
import '../model/chatModel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    logout() {
      AuthHelper.authHelper.signOut();
      Fluttertoast.showToast(msg: "Signed Out", textColor: Colors.black);
      Get.toNamed('/sign-in');
    }

    Stream? newText;

    List images = [
      "https://i.pinimg.com/564x/67/6d/84/676d849e498d5fb2e9810c9a35daf20b.jpg",
      "https://i.pinimg.com/564x/9c/d9/36/9cd9368191199f69a190d7b943c980bb.jpg",
      "https://i.pinimg.com/564x/ba/6b/f8/ba6bf8451d18a38ba4039eaa738e42d9.jpg",
      "https://i.pinimg.com/736x/8f/4a/ad/8f4aade64747830c60dae63bc65af2a9.jpg",
      "https://i.pinimg.com/564x/28/bb/e5/28bbe59d82a590f916ec7997a83b82e0.jpg",
      "https://i.pinimg.com/564x/c3/03/b6/c303b694ad53d7d17893f03d09c1941a.jpg",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat Bee",
          style: subFont(size: 30),
        ),
        centerTitle: true,
        toolbarHeight: 120,
        backgroundColor: widgetColor,
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: widgetColor),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(34),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: CloudFireStoreHelper.fireStoreHelper.fetchUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasError) {
            List<QueryDocumentSnapshot<Map<String, dynamic>>>? users =
                snapshot.data?.docs;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: users?.length,
              itemBuilder: (ctx, i) {
                return Container();
              },
            );
          }

          return ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed('/chat');

                  // Chat chat = Chat(
                  //   message: '',
                  //   receiver: "${users?[i]['uid']}",
                  //   sender: "${AuthHelper.auth.currentUser?.uid}",
                  // );
                  // newText = await CloudFireStoreHelper.fireStoreHelper
                  //     .fetchMessage(chatdetails: chat);
                  // Get.toNamed('/chat', arguments: [
                  //   "${users?[i]['name']}",
                  //   "${users?[i]['profile_picture']}",
                  //   "${users?[i]['uid']}",
                  // ]);
                },
                child: Container(
                  height: Get.height / 10,
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  decoration: BoxDecoration(
                    color: Colors.yellow.withOpacity(0.0),
                    borderRadius: BorderRadius.circular(0),
                    // border: Border.symmetric(
                    //   horizontal: BorderSide(color: Colors.yellowAccent, width: 2),
                    // ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: Get.height / 18.5,
                        width: Get.width / 8.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(05),
                          color: Colors.yellow,
                          image: DecorationImage(
                            image: NetworkImage("${images[i]}"),
                          ),
                        ),
                      ),
                      Text(
                        "User name",
                        style: subFont(
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "time stamp",
                        style: subFont(
                          size: 10,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );

          // return Shimmer.fromColors(
          //   baseColor: Colors.grey.shade300,
          //   highlightColor: Colors.white,
          //   child: const Column(
          //     children: [
          //       Card(
          //         child: ListTile(
          //           title: Text(""),
          //           subtitle: Text(""),
          //           leading: CircleAvatar(
          //             radius: 30,
          //           ),
          //         ),
          //       ),
          //       Card(
          //         child: ListTile(
          //           title: Text(""),
          //           subtitle: Text(""),
          //           leading: CircleAvatar(
          //             radius: 30,
          //           ),
          //         ),
          //       ),
          //       Card(
          //         child: ListTile(
          //           title: Text(""),
          //           subtitle: Text(""),
          //           leading: CircleAvatar(
          //             radius: 30,
          //           ),
          //         ),
          //       ),
          //       Card(
          //         child: ListTile(
          //           title: Text(""),
          //           subtitle: Text(""),
          //           leading: CircleAvatar(
          //             radius: 30,
          //           ),
          //         ),
          //       ),
          //       Card(
          //         child: ListTile(
          //           title: Text(""),
          //           subtitle: Text(""),
          //           leading: CircleAvatar(
          //             radius: 30,
          //           ),
          //         ),
          //       ),
          //       Card(
          //         child: ListTile(
          //           title: Text(""),
          //           subtitle: Text(""),
          //           leading: CircleAvatar(
          //             radius: 30,
          //           ),
          //         ),
          //       ),
          //       Card(
          //         child: ListTile(
          //           title: Text(""),
          //           subtitle: Text(""),
          //           leading: CircleAvatar(
          //             radius: 30,
          //           ),
          //         ),
          //       ),
          //       Card(
          //         child: ListTile(
          //           title: Text(""),
          //           subtitle: Text(""),
          //           leading: CircleAvatar(
          //             radius: 30,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // );
        },
      ),
    );
  }
}

//
