import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 60),
      child: Center(
        child: Icon(size: 48, color: Colors.grey, Icons.playlist_add),
      ),
    );
  }
}
