import 'package:flutter/material.dart';
import 'package:todo_app/features/todo/domain/entities/todo_model.dart';
import 'package:todo_app/features/todo/presentation/components/todo_item.dart';

class TodoListview extends StatelessWidget {
  const TodoListview({super.key, required this.todos});
  final List<TodoModel> todos;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => TodoItem(todoModel: todos[index]),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
              itemCount: todos.length),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
