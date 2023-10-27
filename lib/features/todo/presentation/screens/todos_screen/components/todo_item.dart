import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/status.dart';
import 'package:todo_app/features/todo/domain/entities/todo_model.dart';
import 'package:todo_app/features/todo/presentation/controller/cubit/todo_cubit.dart';
import 'package:todo_app/features/todo/presentation/screens/todos_screen/view/todo_details.dart';
import 'package:todo_app/utils/date_helper.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todoModel});
  final TodoModel todoModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TodoDetails(todoModel: todoModel),
            ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15).w,
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 5,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                      todoModel.title,
                      style: TextStyle(
                          decoration:
                              todoModel.status == Status.done ? TextDecoration.lineThrough : null,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    formatTime(todoModel.created),
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 22,
                  ),
                  Expanded(
                    child: Text(
                      todoModel.description,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.sp,
                          decoration:
                              todoModel.status == Status.done ? TextDecoration.lineThrough : null),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Checkbox(
                    value: todoModel.status == Status.done,
                    onChanged: (value) {
                      if (todoModel.status == Status.done) {
                        todoModel.status = Status.unDone;
                      } else {
                        todoModel.status = Status.done;
                      }
                      TodoCubit.get(context).editTodo(todoModel);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
