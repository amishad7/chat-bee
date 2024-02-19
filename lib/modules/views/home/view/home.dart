import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    int NavigationIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
      ),
      body: NavigationRail(
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.add),
            label: Text(""),
          ),
        ],
        selectedIndex: NavigationIndex,
      ),
    );
  }
}
