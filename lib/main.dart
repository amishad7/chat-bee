import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/modules/views/intro/view/get-started.dart';
import 'package:firebase_project/modules/views/intro/view/splash.dart';
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

        // GetPage(
        //   name: '/wc',
        //   page: () => const StartView(),
        // ),
        // GetPage(
        //   name: '/register',
        //   page: () => const Register(),
        // ),
        // GetPage(
        //   name: '/home',
        //   page: () => const HomeView(),
        // ),
        // GetPage(
        //   name: '/login',
        //   page: () => const LoginView(),
        // ),
      ],
    ),
  );
}
