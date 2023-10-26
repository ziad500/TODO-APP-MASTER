import 'package:todo_app/core/constants.dart';

class TodoModel {
  int? id;
  String title;
  String description;
  String created;
  String status;

  TodoModel(
      {this.id,
      required this.title,
      required this.description,
      required this.created,
      required this.status});

  Map<String, dynamic> toMap() {
    return {
      TodoFields.id: null,
      TodoFields.title: title,
      TodoFields.description: description,
      TodoFields.status: status,
      TodoFields.created: created,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map[TodoFields.id],
      title: map[TodoFields.title],
      description: map[TodoFields.description],
      status: map[TodoFields.status],
      created: map[TodoFields.created],
    );
  }

  TodoModel copyWith({
    int? id,
    String? title,
    String? description,
    String? created,
    String? status,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      created: created ?? this.created,
    );
  }
}
