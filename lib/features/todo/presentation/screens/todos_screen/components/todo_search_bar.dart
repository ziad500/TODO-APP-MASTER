import 'package:flutter/material.dart';
import 'package:todo_app/common/main_button.dart';
import 'package:todo_app/features/todo/presentation/controller/cubit/todo_cubit.dart';
import 'package:todo_app/features/todo/presentation/screens/search_screen/view/search_screen.dart';

class TodoSearchBar extends StatelessWidget {
  const TodoSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MainButton(
      title: "Search",
      icon: Icons.search,
      height: 40,
      onPressed: () {
        TodoCubit.get(context).searchList = TodoCubit.get(context).allTodos;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchScreen(),
            ));
      },
    );
  }
}
