import 'package:flutter/material.dart';
import 'package:todo_app/common/default_form_field.dart';
import 'package:todo_app/features/todo/presentation/controller/cubit/todo_cubit.dart';

class SearchFormField extends StatelessWidget {
  SearchFormField({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultFormField(
      controller: searchController,
      hint: "Search",
      onChanged: (p0) {
        TodoCubit.get(context).search(p0);
      },
      validator: (value) {
        return null;
      },
    );
  }
}
