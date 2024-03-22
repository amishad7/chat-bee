import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/modules/utils/globals/globals.dart';
import 'package:firebase_project/modules/views/intro/view/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/globals/colors.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    int intial = 0;

    List<String> user =
        ModalRoute.of(context)!.settings.arguments as List<String>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: widgetColor,
        toolbarHeight: 70,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        flexibleSpace: Stack(
          children: [
            Transform.translate(
              offset: const Offset(50, 70),
              child: Container(
                height: Get.height / 23,
                width: Get.width / 10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(05),
                  image: DecorationImage(
                    image: NetworkImage("${user[1]}"),
                  ),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        title: Text(
          user[0],
          style: subFont(color: Colors.black),
        ),
        actions: [
          PopupMenuButton(
            initialValue: intial,
            color: widgetColor,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white, width: 3),
            ),
            onSelected: (val) {
              intial = val;
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Delete chat"),
                      Icon(
                        Icons.delete,
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(),
          ),
          Container(
            alignment: Alignment.bottomCenter,

            // color: Colors.yellow,
            child: Container(
              height: 64,
              alignment: Alignment.bottomCenter,
              padding:
                  const EdgeInsets.only(top: 5, bottom: 7, right: 5, left: 10),
              margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34),
                color: Colors.grey.withOpacity(0.4),
              ),
              child: TextFormField(
                style: const TextStyle(color: Colors.black, fontSize: 20),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera,
                      color: cBlack,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                      color: cBlack,
                    ),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
