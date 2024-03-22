import 'package:animated_introduction/animated_introduction.dart';
import 'package:firebase_project/modules/views/intro/view/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView2 extends StatelessWidget {
  const SplashView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widgetColor,
      body: AnimatedIntroduction(
        physics: const BouncingScrollPhysics(),
        doneText: "LOGIN",
        footerBgColor: widgetColor,
        isFullScreen: true,
        slides: [
          SingleIntroScreen(
            sideDotsBgColor: Colors.amber.shade300,
            // mainCircleBgColor: Colors.white,
            title: 'HEY THERE!',
            description: 'CHAT WITH YOUR FRIENDS AND FAMILY ',
            textStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            imageNetwork:
                'https://i.pinimg.com/564x/4c/d8/ca/4cd8ca6e7441500b5f62db140ab896b4.jpg',
          ),
          SingleIntroScreen(
            sideDotsBgColor: Colors.amber.shade300,
            title: 'DO REGISTER',
            textStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            description: 'CREATE YOUR OWN ACCOUNT AND TEXT EVERYONE.',
            imageNetwork:
                'https://i.pinimg.com/564x/f5/78/68/f578684cf3480792a2ce3107faed80ff.jpg',
          ),
        ],
        indicatorType: IndicatorType.line,
        onDone: () {
          Get.offNamed('/get');
        },
      ),
    );
  }
}
