import 'package:flutter/material.dart';
import 'package:todo_app/common/main_button.dart';

class TodoSearchBar extends StatelessWidget {
  const TodoSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MainButton(
      title: "Search",
      icon: Icons.search,
      height: 40,
      onPressed: () {},
    );
  }
}
