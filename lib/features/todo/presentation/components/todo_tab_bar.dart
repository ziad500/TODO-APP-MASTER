import 'package:flutter/material.dart';

class TodoTabBar extends StatelessWidget {
  const TodoTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(tabs: [
      Tab(
        text: "All",
      ),
      Tab(
        text: "Done",
      ),
      Tab(
        text: "Undone",
      )
    ]);
  }
}
