// userNameValidator(value) {
//   if (value == null || value.isEmpty) {
//     return 'Please enter something';
//   }
//   return null;
// }
import 'dart:developer';

import 'package:firebase_project/modules/utils/helpers/authhelper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../../../../../utils/globals/globals.dart';
import '../../../sign-up/model/signInModel.dart';
import '../../controller/Sign-in-controller.dart';

SignInController loginController = Get.put(SignInController());

TextStyle loginTextStyle(
        {Color color = Colors.white,
        FontWeight weight = FontWeight.bold,
        double size = 20}) =>
    TextStyle(
      color: color,
      fontWeight: weight,
      fontSize: size,
    );

TextEditingController usernameEditor = TextEditingController();

TextEditingController passwordEditor = TextEditingController();

var seePassword = loginController.model.password;

passwordTextField({required TextEditingController textEditingController}) =>
    TextFormField(
      style: loginTextStyle(color: Colors.black, weight: FontWeight.normal),

      controller: passwordEditor,
      scrollPhysics: const BouncingScrollPhysics(),
      autocorrect: false,
      mouseCursor: MouseCursor.defer,

      cursorColor: const Color(0xffc9c9c9),

      autovalidateMode: AutovalidateMode.onUserInteraction,
      //   validator: userNameValidator(context),
      obscureText: seePassword.value,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        alignLabelWithHint: true,
        hintText: "password",
        suffixIcon: IconButton(
          onPressed: () {
            loginController.hidePassword();
            log('${seePassword.value}');
          },
          icon: (seePassword.value)
              ? const Icon(
                  Icons.lock_outline,
                  color: Color(0xffc9c9c9),
                )
              : const Icon(
                  Icons.lock_open_rounded,
                  color: Color(0xffc9c9c9),
                ),
        ),
        hintFadeDuration: const Duration(milliseconds: 1000),
        hintStyle: const TextStyle(
          color: Color(0xffc9c9c9),
          fontSize: 16,
        ),
      ),

      onChanged: (val) {
        password = val;
        Get.snackbar('value', "$password");
      },
    );

userTextField({required TextEditingController textEditingController}) =>
    TextFormField(
      controller: usernameEditor,
      cursorColor: const Color(0xffc9c9c9),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: loginTextStyle(color: Colors.black, weight: FontWeight.normal),
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        alignLabelWithHint: true,
        hintText: "email",
        hintFadeDuration: Duration(milliseconds: 1000),
        hintStyle: TextStyle(
          color: Color(0xffc9c9c9),
          fontSize: 19,
          fontWeight: FontWeight.normal,
        ),
      ),
      onChanged: (val) {
        mail = val;
        Get.snackbar('value of mail', "$mail");
      },
    );

onRegister() async {
  LoginCredentials credentials =
      LoginCredentials(email: mail ?? "", password: password ?? "");
  Map<String, dynamic> res =
      await RegisterHelper.registerHelper.signUp(credentials: credentials);
  if (res['error'] != null) {
    log("==================================================");
    log("${res['error']}");
    log("==================================================");

    Fluttertoast.showToast(msg: "Sign up failed", textColor: Colors.red);
  } else {
    usernameEditor.clear();
    passwordEditor.clear();
    Fluttertoast.showToast(msg: "Sign up Success", textColor: Colors.black);
  }
}
