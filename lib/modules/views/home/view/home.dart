import 'package:firebase_project/modules/views/intro/view/components/components.dart';
import 'package:flutter/material.dart';
import '../../../utils/globals/globals.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    int NavigationIndex = 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: widgetColor,
        toolbarHeight: 125,
        // elevation: 34,
        title: Text(
          "   Your messages",
          style: mainFont(size: 23),
        ),
        shape: OutlineInputBorder(
          // gapPadding: ,
          borderSide: BorderSide(
            color: widgetColor,
          ),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(34),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Container(
          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(45)),
          //   child: BottomNavigationBar(
          //     items: [
          //       BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.home),
          //         label: "requets",
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
