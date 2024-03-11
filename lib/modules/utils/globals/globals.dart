import 'package:firebase_project/modules/views/chat/view/chat.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';
import 'package:get/get.dart';
import '../../views/home/view/home.dart';
import '../../views/intro/view/get-started.dart';
import '../../views/intro/view/splash.dart';
import '../../views/register/views/components/tabs/sign-in/controller/Sign-in-controller.dart';
import '../../views/register/views/components/tabs/sign-in/view/sign-in.dart';
import '../../views/register/views/components/tabs/sign-up/model/signInModel.dart';
import '../../views/register/views/components/tabs/sign-up/view/sign-up.dart';
import '../helpers/authHelper.dart';

List<GetPage<dynamic>>? pages = [
  // GetPage(
  //   name: '/',
  //   page: () => const Register(),
  // ),
  GetPage(
    name: '/intro',
    page: () => const IntroView(),
  ),

  GetPage(
    name: '/get',
    page: () => const GetStarted(),
  ),
  GetPage(
    name: '/sign-in',
    page: () => const SignInView(),
  ),
  GetPage(
    name: '/sign-up',
    page: () => const SignupView(),
  ),
  GetPage(
    name: '/home',
    page: () => const HomeView(),
  ),
  GetPage(
    name: '/chat',
    page: () => const ChatView(),
  ),
];

bool visited = false;
String? password;
String? mail;

TextEditingController usernameSecEditor = TextEditingController();
TextEditingController passwordSecEditor = TextEditingController();
TextEditingController usernameEditor = TextEditingController();
TextEditingController passwordEditor = TextEditingController();
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

var seePassword = loginController.model.password;

passwordTextField({required TextEditingController textEditingController}) =>
    TextFormField(
      style: loginTextStyle(color: Colors.black, weight: FontWeight.normal),

      controller: textEditingController,
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

//todo:email field

userTextField({required TextEditingController textEditingController}) =>
    TextFormField(
      controller: textEditingController,
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

onSignUp() async {
  LoginCredentials credentials = LoginCredentials(
      email: usernameSecEditor.text, password: passwordSecEditor.text);
  Map<String, dynamic> res =
      await AuthHelper.authHelper.signUp(credentials: credentials);
  if (res['error'] != null) {
    Fluttertoast.showToast(msg: "Sign up failed", textColor: Colors.red);
  } else {
    usernameSecEditor.clear();
    passwordSecEditor.clear();
    Fluttertoast.showToast(msg: "Sign up Success", textColor: Colors.black);

    Get.offAllNamed('/home');
  }
}

SignOut() {
  AuthHelper.authHelper.signOut();
}
