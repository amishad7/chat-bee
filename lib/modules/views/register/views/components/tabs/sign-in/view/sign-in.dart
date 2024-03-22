import 'dart:developer';
import 'package:firebase_project/modules/utils/globals/globals.dart';
import 'package:firebase_project/modules/utils/helpers/authHelper.dart';
import 'package:firebase_project/modules/views/intro/view/components/components.dart';
import 'package:firebase_project/modules/views/register/views/components/tabs/sign-up/model/signInModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../../../utils/helpers/cloudHelper.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginFormFieldKey = GlobalKey<FormFieldState>();
    TextEditingController usernameEditor = TextEditingController();
    TextEditingController passwordEditor = TextEditingController();
    return Scaffold(
      backgroundColor: widgetColor,
      body: SafeArea(
        child: Stack(
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
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/sign-up');
                    },
                    child: Text(
                      "Create Account",
                      style: mainFont(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: const Offset(145, 90),
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
                ),
              ),
            ),
            Form(
              key: loginFormFieldKey,
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
                      ),
                      child:
                          userTextField(textEditingController: usernameEditor),
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
                          textEditingController: passwordEditor,
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(70, 270),
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        log(usernameEditor.text);

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
                children: [
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.black,
                      fixedSize: const Size(325, 50),
                      elevation: 20,
                    ),
                    onPressed: () async {
                      LoginCredentials credentials = await LoginCredentials(
                        email: usernameEditor.text,
                        password: passwordEditor.text,
                      );

                      log(" mail :  ${usernameEditor.text}");

                      Map<String, dynamic> res = await AuthHelper.authHelper
                          .signIn(credentials: credentials);
                      if (res['error'] != null) {
                        Fluttertoast.showToast(
                            msg: "Login failed", textColor: Colors.red);
                      } else {
                        usernameEditor.clear();
                        passwordEditor.clear();
                        Get.toNamed('/home');
                        Fluttertoast.showToast(
                            msg: "Login Success", textColor: Colors.black);
                        CloudFireStoreHelper.fireStoreHelper.addUser();
                      }
                    },
                    child: Text(
                      "SIGN IN",
                      style: subFont(size: 15, weight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(height: 34),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 5,
                      fixedSize: const Size(330, 60),
                    ),
                    onPressed: onAnonymous,
                    child: Text(
                      "Sign In Anonymous",
                      style: mainFont(size: 15, color: Colors.black),
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
                    onPressed: () {},
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
      ),
    );
  }
}
