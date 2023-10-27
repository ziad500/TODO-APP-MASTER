import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/presentation/screens/todos_screen/components/todo_listview.dart';
import 'package:todo_app/features/todo/presentation/controller/cubit/todo_cubit.dart';

class DoneTodoList extends StatelessWidget {
  const DoneTodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        var cubit = TodoCubit.get(context);
        if (state is GetAllTodosLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (cubit.doneTodos.isNotEmpty) {
          return TodoListview(todos: cubit.doneTodos);
        } else {
          return const Center(
            child: Text("No data"),
          );
        }
      },
    );
  }
}
