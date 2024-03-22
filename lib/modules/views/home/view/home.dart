import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/modules/utils/globals/globals.dart';
import 'package:firebase_project/modules/utils/helpers/authHelper.dart';
import 'package:firebase_project/modules/views/intro/view/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../../../utils/helpers/cloudHelper.dart';
import '../model/chatModel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Stream? newText;

    List images = [
      "https://i.pinimg.com/564x/67/6d/84/676d849e498d5fb2e9810c9a35daf20b.jpg",
      "https://i.pinimg.com/564x/9c/d9/36/9cd9368191199f69a190d7b943c980bb.jpg",
      "https://i.pinimg.com/564x/ba/6b/f8/ba6bf8451d18a38ba4039eaa738e42d9.jpg",
      "https://i.pinimg.com/736x/8f/4a/ad/8f4aade64747830c60dae63bc65af2a9.jpg",
      "https://i.pinimg.com/564x/28/bb/e5/28bbe59d82a590f916ec7997a83b82e0.jpg",
      "https://i.pinimg.com/564x/c3/03/b6/c303b694ad53d7d17893f03d09c1941a.jpg",
    ];

    Random random = Random();
    int imgIndex = Random().nextInt(images.length);

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.yellow.shade100,
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height / 5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(45, 34),
                  colors: [
                    Colors.yellowAccent,
                    Colors.white70,
                    Colors.yellow.shade300
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 58.0, top: 78),
              child: Container(
                height: Get.height / 5.6,
                width: Get.width / 2.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.yellow,
                  border: Border.all(width: 8, color: Colors.white),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://i.pinimg.com/564x/cc/c5/95/ccc595fcbccb5b97e940a5909382e223.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 268.0, left: 120),
              child: Column(
                children: [
                  (AuthHelper.auth.currentUser?.displayName == null)
                      ? Text(
                          "${AuthHelper.auth.currentUser?.email?.split("@")[0].capitalizeFirst}",
                          style: subFont(color: Colors.black),
                        )
                      : Text(
                          "${AuthHelper.auth.currentUser?.displayName}",
                          style: subFont(color: Colors.black),
                        ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 340, left: 100),
              child: FilledButton(
                style: FilledButton.styleFrom(backgroundColor: Colors.black),
                onPressed: signOut,
                child: Text(
                  "Log Out",
                  style: GoogleFonts.poppins()
                      .copyWith(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Home "),
        centerTitle: true,
        toolbarHeight: 100,
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
          } else if (snapshot.hasData) {
            List<QueryDocumentSnapshot<Map<String, dynamic>>>? users =
                snapshot.data?.docs;

            print("$users");

            return ListView.builder(
              shrinkWrap: true,
              itemCount: users?.length,
              itemBuilder: (ctx, i) {
                print(" title: ${users?[i]['name']} ${users?[i]['email']}");

                return GestureDetector(
                  onTap: () async {
                    print("${images[i]}");

                    Chat chat = Chat(
                      message: '',
                      receiver: "${users?[i]['uid']}",
                      sender: "${AuthHelper.auth.currentUser?.uid}",
                    );
                    newText = await CloudFireStoreHelper.fireStoreHelper
                        .fetchMessage(chatDetails: chat);
                    Get.toNamed('/chat', arguments: [
                      "${users?[i]['name']}",
                      "${images[i]}",
                      "${users?[i]['uid']}",
                    ]);
                  },
                  child: Container(
                    height: Get.height / 10,
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    decoration: BoxDecoration(
                      color: Colors.yellow.withOpacity(0.0),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        const SizedBox(
                          width: 45,
                        ),
                        Text(
                          "${users?[i]['name']}",
                          style: subFont(
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                        // IconButton(onPressed: () {}, icon: Icon())
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: const Column(
              children: [
                Card(
                  child: ListTile(
                    title: Text(""),
                    subtitle: Text(""),
                    leading: CircleAvatar(
                      radius: 30,
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(""),
                    subtitle: Text(""),
                    leading: CircleAvatar(
                      radius: 30,
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(""),
                    subtitle: Text(""),
                    leading: CircleAvatar(
                      radius: 30,
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(""),
                    subtitle: Text(""),
                    leading: CircleAvatar(
                      radius: 30,
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(""),
                    subtitle: Text(""),
                    leading: CircleAvatar(
                      radius: 30,
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(""),
                    subtitle: Text(""),
                    leading: CircleAvatar(
                      radius: 30,
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(""),
                    subtitle: Text(""),
                    leading: CircleAvatar(
                      radius: 30,
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(""),
                    subtitle: Text(""),
                    leading: CircleAvatar(
                      radius: 30,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

//
