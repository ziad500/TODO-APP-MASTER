import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/presentation/controller/cubit/todo_cubit.dart';
import 'package:todo_app/features/todo/presentation/screens/todos_screen/components/todo_listview.dart';

class SearchList extends StatelessWidget {
  const SearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      buildWhen: (previous, current) => current is GetSearchList,
      builder: (context, state) {
        var cubit = TodoCubit.get(context);
        if (cubit.searchList.isNotEmpty) {
          return Expanded(child: TodoListview(todos: cubit.searchList));
        } else {
          return const Center(
            child: Text("no data"),
          );
        }
      },
    );
  }
}
