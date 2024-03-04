import 'dart:developer';
import 'package:firebase_project/modules/utils/globals/globals.dart';
import 'package:firebase_project/modules/views/intro/view/components/components.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'components/components.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginFormFieldKey = GlobalKey<FormFieldState>();

    return Scaffold(
      backgroundColor: widgetColor,
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(
                  color: Colors.black.withOpacity(0.8),
                ),
                TextButton(
                  onPressed: register,
                  child: Text(
                    "Register",
                    style: mainFont(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: const Offset(145, 60),
            child: Text(
              "Sign In",
              style: subFont(
                color: Colors.black,
                size: 40,
                weight: FontWeight.bold,
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, 120),
            child: Container(
              height: Get.height / 1.25,
              width: Get.width,
              margin: const EdgeInsets.only(top: 67),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
                boxShadow: [
                  // BoxShadow(
                  //   color: Colors.grey.withOpacity(0.3),
                  //   blurRadius: 20,
                  // ),
                ],
              ),
            ),
          ),
          Form(
            key: loginFormFieldKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // TODO: USERNAME TEXT FORM FILED
                Transform.translate(
                  offset: const Offset(0, 260),

                  //TODO: DECORATE CONTAINER FAIRY

                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xffeeeeee),
                      // color: const Color(0xffeeeeee),
                    ),
                    child: userTextField(textEditingController: usernameEditor),
                  ),
                ),
                // TODO: PASSWORD TEXT FORM FILED
                Transform.translate(
                  offset: const Offset(0, 280),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xffeeeeee),
                    ),
                    child: Obx(
                      () => passwordTextField(
                        textEditingController: passwordEditor,
                      ),
                    ),
                  ),
                ),
                // TODO: FORGET PASSWORD BUTTON
                Transform.translate(
                  offset: const Offset(70, 270),
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      log('done');
                    },
                    child: Text(
                      "FORGET PASSWORD?".toLowerCase(),
                      style: subFont(
                        color: Colors.black,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: const Offset(45, 500),
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.black,
                    fixedSize: const Size(325, 50),
                    elevation: 20,
                  ),
                  onPressed: () {
                    Get.snackbar('sign in ', 'done');
                  },
                  child: Text(
                    "SIGN IN",
                    style: subFont(size: 15, weight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: 34),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    //  shape: const StadiumBorder(),
                    // padding: EdgeInsets.only(top: 40),
                    elevation: 5,
                    //  shadowColor: Colors.blueAccent.withOpacity(0.5),
                    fixedSize: const Size(330, 60),
                  ),
                  onPressed: () {
                    Get.snackbar('to google sign in ', 'done');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.black,
                      ),
                      Text(
                        "Continue with Google",
                        style: mainFont(size: 15, color: Colors.black),
                      ),
                      const Icon(
                        Icons.arrow_circle_right_rounded,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  register() {
    Get.defaultDialog(
      backgroundColor: Colors.white,
      title: "Chatters Hub",
      titleStyle: subFont(size: 22),
      content: Column(
        children: [
          userTextField(textEditingController: usernameEditor),
          const SizedBox(
            height: 20,
          ),
          passwordTextField(textEditingController: passwordEditor),
        ],
      ),
      confirm: ElevatedButton(
        onPressed: onRegister,
        child: Text(
          "Register",
          style: subFont(),
        ),
      ),
    );
  }
}
