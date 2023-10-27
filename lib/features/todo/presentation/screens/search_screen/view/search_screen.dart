import 'package:flutter/material.dart';
import 'package:todo_app/features/todo/presentation/screens/search_screen/components/search_formField_widget.dart';
import 'package:todo_app/features/todo/presentation/screens/search_screen/components/search_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SearchFormField(),
            const SizedBox(
              height: 16,
            ),
            const SearchList()
          ],
        ),
      ),
    );
  }
}
