import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/todo/domain/entities/todo_model.dart';

class TodoDetails extends StatelessWidget {
  const TodoDetails({super.key, required this.todoModel});
  final TodoModel todoModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todoModel.title,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.sp),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              todoModel.description,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
