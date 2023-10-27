import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/common/main_button.dart';
import 'package:todo_app/features/todo/presentation/screens/todos_screen/components/bottom_sheet_widget.dart';

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0).w,
      child: MainButton(
        title: "Add New Task",
        height: 50.h,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const BottomSheetWidget(),
              );
            },
          );
        },
        icon: Icons.add_circle,
      ),
    );
  }
}
