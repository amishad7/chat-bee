import 'dart:developer';
import 'package:firebase_project/modules/views/register/views/components/tabs/sign-up/model/signInModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../../../../../utils/helpers/authHelper.dart';
import '../../../../../../../../utils/helpers/cloudHelper.dart';

anonymous() async {
  Map<String, dynamic> res = await AuthHelper.authHelper.signInAnonymous();
  if (res['error'] != null) {
    log("login failed");
  } else {
    log("login success");
    Get.offAllNamed('/home');
  }
}

//todo: signup btn click
signUp({required String email, required String password}) async {
  SignInCredentials signUpModel =
      SignInCredentials(email: email, password: password);
  Map<String, dynamic> res =
      await AuthHelper.authHelper.signUp(signUpModel: signUpModel);
  if (res['error'] != null) {
    log('signup failed');
  } else {
    log('user created');

    Get.toNamed('/home');
  }
}

//todo: login btn click
signIn() async {
  SignInCredentials signUpModel =
      SignInCredentials(email: email, password: password);
  Map<String, dynamic> res =
      await AuthHelper.authHelper.login(signUpModel: signUpModel);
  if (res['error'] != null) {
    Fluttertoast.showToast(msg: 'login failed');

    return log("login failed");
  } else {
    Get.offAllNamed('/home');

    FireStoreHelper.fireStoreHelper.addUser();

    return log("login success");
  }
}
//
// //todo:login with email and password
// login() async {
//   LoginCredentials credentials =
//   LoginCredentials(email: email!, password: password!);
//   Map<String, dynamic> res =
//   await AuthHelper.authHelper.signIn(credentials: credentials);
//   if (res['error'] != null) {
//     Fluttertoast.showToast(msg: "Login failed", textColor: Colors.red);
//   } else {
//     emailController.clear();
//     passwordController.clear();
//     Get.toNamed('/home');
//     Fluttertoast.showToast(msg: "Login Success", textColor: Colors.black);
//     CloudFireStoreHelper.fireStoreHelper.addUser();
//   }
// }

google() async {
  Map<String, dynamic> res = await AuthHelper.authHelper.signInWithGoogle();
  if (res['error'] != null) {
    return log('login failed');
  } else {
    Get.offAllNamed('/home');
    FireStoreHelper.fireStoreHelper.addUser();
  }
}
