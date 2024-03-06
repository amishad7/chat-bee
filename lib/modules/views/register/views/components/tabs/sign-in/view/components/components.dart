import 'dart:developer';
import 'package:firebase_project/modules/utils/globals/globals.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../../../../../utils/helpers/authHelper.dart';
import '../../../../../../../../utils/helpers/cloudHelper.dart';
import '../../../sign-up/model/signInModel.dart';

//todo:on Google signin
onGoogleSignin() async {
  Map<String, dynamic> res = await AuthHelper.authHelper.googleSignin();
  if (res['error'] != null) {
    Fluttertoast.showToast(msg: "Login failed", textColor: Colors.red);
  } else {
    Get.toNamed('/home');
    Fluttertoast.showToast(msg: "Login Success", textColor: Colors.black);
    CloudFireStoreHelper.fireStoreHelper.addUser();
  }
}

//todo:user register btn
onRegister() async {
  LoginCredentials credentials =
      LoginCredentials(email: mail ?? "", password: password ?? "");
  Map<String, dynamic> res =
      await AuthHelper.authHelper.signUp(credentials: credentials);
  if (res['error'] != null) {
    Fluttertoast.showToast(msg: "Sign up failed", textColor: Colors.red);
  } else {
    usernameSecEditor.clear();
    passwordSecEditor.clear();
    Fluttertoast.showToast(msg: "Sign up Success", textColor: Colors.black);
  }
}

//todo:login with email and password
login() async {
  LoginCredentials credentials =
      LoginCredentials(email: mail!, password: password!);
  Map<String, dynamic> res =
      await AuthHelper.authHelper.signIn(credentials: credentials);
  if (res['error'] != null) {
    Fluttertoast.showToast(msg: "Login failed", textColor: Colors.red);
  } else {
    usernameEditor.clear();
    passwordEditor.clear();
    Get.toNamed('/home');
    Fluttertoast.showToast(msg: "Login Success", textColor: Colors.black);
    CloudFireStoreHelper.fireStoreHelper.addUser();
  }
}

//todo:login button click
aninymous() async {
  Map<String, dynamic> res = await AuthHelper.authHelper.signInAninyymous();
  if (res['error'] != null) {
    Get.offAndToNamed('/home');
  } else {
    log("login success");
  }
}
