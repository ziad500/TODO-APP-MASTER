import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/common/default_form_field.dart';
import 'package:todo_app/common/main_button.dart';
import 'package:todo_app/common/show_toast.dart';
import 'package:todo_app/core/status.dart';
import 'package:todo_app/features/todo/domain/entities/todo_model.dart';
import 'package:todo_app/features/todo/presentation/controller/cubit/todo_cubit.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});
  static TextEditingController titleController = TextEditingController();
  static TextEditingController descController = TextEditingController();
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DefaultFormField(
                controller: titleController,
                hint: "Title",
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter title";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              DefaultFormField(
                controller: descController,
                maxLines: 6,
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                hint: "Description",
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter description";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 22,
              ),
              BlocListener<TodoCubit, TodoState>(
                listener: (context, state) {
                  if (state is AddTodoSuccessState) {
                    titleController.clear();
                    descController.clear();
                    Navigator.pop(context);
                    showToast(
                        context: context,
                        text: "Task added succssfully",
                        state: ToastStates.SUCCESS);
                  } else if (state is AddTodoErrorState) {
                    showToast(context: context, text: state.error, state: ToastStates.ERROR);
                  }
                },
                child: MainButton(
                  height: 40.h,
                  title: "Done",
                  icon: Icons.done,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      TodoCubit.get(context).addTodo(TodoModel(
                          title: titleController.text,
                          description: descController.text,
                          created: DateTime.now().toString(),
                          status: Status.unDone));
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
