import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';
import 'package:get/get.dart';
import '../../views/register/views/components/tabs/sign-in/controller/Sign-in-controller.dart';

bool visited = false;
String? password;
String? mail;

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
      },
    );

TextStyle mainFont(
        {Color color = Colors.white,
        FontWeight weight = FontWeight.bold,
        double size = 20}) =>
    GoogleFonts.antic(
      color: color,
      fontWeight: weight,
      fontSize: size,
    );

TextStyle subFont(
        {Color color = Colors.white,
        FontWeight weight = FontWeight.bold,
        double size = 20}) =>
    GoogleFonts.nunito(
      color: color,
      fontWeight: weight,
      fontSize: size,
    );
