import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/components.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () {
        Get.toNamed('/get');
      },
    );

    return Scaffold(
      body: Stack(
        children: [
          Transform.translate(
            offset: const Offset(270, -30),
            child: CircleAvatar(
              backgroundColor: widgetColor,
              radius: circleSize! + 30,
            ),
          ),
          Center(
            child: CircleAvatar(
              radius: circleSize,
              child: const Text(
                "LOGO + ICON",
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(-120, 480),
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
