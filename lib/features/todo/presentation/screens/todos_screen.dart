import 'package:flutter/material.dart';
import 'package:todo_app/common/main_button.dart';
import 'package:todo_app/features/todo/presentation/components/add_todo_button.dart';
import 'package:todo_app/features/todo/presentation/components/views/done_todos_view.dart';
import 'package:todo_app/features/todo/presentation/components/todo_appbar.dart';
import 'package:todo_app/features/todo/presentation/components/todo_search_bar.dart';
import 'package:todo_app/features/todo/presentation/components/todo_tab_bar.dart';
import 'package:todo_app/features/todo/presentation/components/views/all_todos_view.dart';
import 'package:todo_app/features/todo/presentation/components/views/undone_todos_view.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: AddTodoButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                TodoAppbar(),
                SizedBox(
                  height: 16,
                ),
                TodoSearchBar(),
                SizedBox(
                  height: 16,
                ),
                TodoTabBar(),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                    child: TabBarView(children: [TodoList(), DoneTodoList(), UnDoneTodoList()]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
