import 'dart:async';

import 'package:firebase_project/modules/utils/globals/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/components.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 6),
      () {
        Get.offAllNamed('/intro2');
      },
    );

    return Scaffold(
      body: Stack(
        children: [
          Transform.translate(
            offset: const Offset(270, -100),
            child: CircleAvatar(
              backgroundColor: widgetColor,
              radius: circleSize! + 30,
            ),
          ),
          Center(
            child: CircleAvatar(
              radius: circleSize! - 39,
              backgroundImage: const NetworkImage(
                  "https://i.pinimg.com/564x/d5/d8/cb/d5d8cbbd1a86f021d7bdd6b5d28861f3.jpg"),
            ),
          ),
          Transform.translate(
            offset: const Offset(160, 520),
            child: Text(
              "Chat bee",
              style: mainFont(color: Colors.black),
            ),
          ),
          Transform.translate(
            offset: const Offset(-180, 540),
            child: CircleAvatar(
              backgroundColor: widgetColor,
              radius: circleSize! + 200,
            ),
          ),
        ],
      ),
    );
  }
}
