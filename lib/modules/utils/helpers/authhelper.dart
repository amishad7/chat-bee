import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../views/register/views/components/tabs/sign-up/model/signInModel.dart';

class RegisterHelper {
  RegisterHelper._();
  static final RegisterHelper registerHelper = RegisterHelper._();
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<Map<String, dynamic>> signInAnonymous() async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential = await firebaseAuth.signInAnonymously();
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }

  Future<Map<String, dynamic>> signUp(
      {required SignInCredentials credentials}) async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: credentials.email, password: credentials.password);
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
      log("${res['error']}");
    }
    return res;
  }

  Future<Map<String, dynamic>> signIn(
      {required SignInCredentials credentials}) async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
              email: credentials.email, password: credentials.password);
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }

  registerWithGoogle() async {
    Map<String, dynamic> res = {};
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }
}
