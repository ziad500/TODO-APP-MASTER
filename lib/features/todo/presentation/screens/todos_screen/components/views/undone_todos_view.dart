import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/common/empty_list.dart';
import 'package:todo_app/features/todo/presentation/screens/todos_screen/components/todo_listview.dart';
import 'package:todo_app/features/todo/presentation/controller/cubit/todo_cubit.dart';

class UnDoneTodoList extends StatelessWidget {
  const UnDoneTodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        var cubit = TodoCubit.get(context);
        if (state is GetAllTodosLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (cubit.unDoneTodos.isNotEmpty) {
          return TodoListview(todos: cubit.unDoneTodos);
        } else {
          return const EmptyList();
        }
      },
    );
  }
}
