import 'package:flutter/material.dart';
import '../../../utils/globals/globals.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    int NavigationIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
      ),
    );
  }
}
