import 'dart:developer';
import 'package:firebase_project/modules/views/intro/view/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../utils/globals/globals.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    // var seePassword = loginController.model.password;
    final signupFormFieldKey = GlobalKey<FormFieldState>();

    return Scaffold(
      backgroundColor: widgetColor,
      body: SafeArea(
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 20, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                      log("Back");
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: const Offset(145, 60),
              child: Text(
                "Sign Up",
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
              key: signupFormFieldKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(0, 260),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xffeeeeee),
                        // color: const Color(0xffeeeeee),
                      ),
                      child: userTextField(
                          textEditingController: usernameSecEditor),
                    ),
                  ),
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
                          textEditingController: passwordSecEditor,
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
                    onPressed: onSignUp,
                    child: Text(
                      "SIGN UP",
                      style: subFont(size: 15, weight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(height: 34),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      //  shape: const StadiumBorder(),
                      // padding: EdgeInsets.only(top: 40),
                      elevation: 5,
                      //  shadowColor: Colors.blueAccent.withOpacity(0.5),
                      fixedSize: const Size(330, 60),
                    ),
                    onPressed: onAnonymous,
                    child: Text(
                      "Sign In Anonymous",
                      style: mainFont(size: 15, color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 34),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
