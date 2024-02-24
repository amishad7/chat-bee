import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/modules/views/home/view/home.dart';
import 'package:firebase_project/modules/views/login/view/login.dart';
import 'package:firebase_project/modules/views/register/view/register.dart';
import 'package:firebase_project/modules/views/welocme/view/start.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/wc',
      getPages: [
        GetPage(
          name: '/wc',
          page: () => const StartView(),
        ),
        GetPage(
          name: '/register',
          page: () => const Register(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomeView(),
        ),
        GetPage(
          name: '/login',
          page: () => const LoginView(),
        ),
      ],
    ),
  );
}
