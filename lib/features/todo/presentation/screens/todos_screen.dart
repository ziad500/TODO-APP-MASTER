import 'package:flutter/material.dart';
import 'package:todo_app/features/todo/domain/entities/todo_model.dart';
import 'package:todo_app/features/todo/presentation/controller/cubit/todo_cubit.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              TodoCubit.get(context).addTodo(TodoModel(
                  title: "title",
                  description: "description",
                  created: DateTime.now().toString(),
                  status: "done".toString()));
            },
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}
