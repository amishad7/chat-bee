import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/modules/views/home/view/home.dart';
import 'package:firebase_project/modules/views/intro/view/get-started.dart';
import 'package:firebase_project/modules/views/intro/view/splash.dart';
import 'package:firebase_project/modules/views/register/views/components/tabs/sign-in/view/sign-in.dart';
import 'package:firebase_project/modules/views/register/views/components/tabs/sign-up/view/sign-up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'modules/views/register/views/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/intro',
      getPages: [
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
      ],
    ),
  );
}
