import 'package:dartz/dartz.dart';
import 'package:todo_app/core/failure.dart';
import 'package:todo_app/features/todo/data/database/todo_database.dart';
import 'package:todo_app/features/todo/domain/entities/todo_model.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repo.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoDatabaseHelper todoDatabaseHelper;
  TodoRepositoryImpl(this.todoDatabaseHelper);
  @override
  Future<Either<Failure, TodoModel>> addTodo(TodoModel todoModel) async {
    try {
      final results = await todoDatabaseHelper.addTodo(todoModel);
      return right(results);
    } catch (e) {
      return left(Failure(/* "Failed to add todo" */ e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteTodo(String todoId) async {
    try {
      final results = await todoDatabaseHelper.deleteTodo(todoId);
      return right(results);
    } catch (e) {
      return left(Failure("Failed to delete todo"));
    }
  }

  @override
  Future<Either<Failure, TodoModel>> editTodo(TodoModel todoModel) async {
    try {
      final results = await todoDatabaseHelper.editTodo(todoModel);
      return right(results);
    } catch (e) {
      return left(Failure("Failed to edit todo"));
    }
  }

  @override
  Future<Either<Failure, List<TodoModel>>> getAllTodos() async {
    try {
      final results = await todoDatabaseHelper.getAllTodos();
      return right(results);
    } catch (e) {
      return left(Failure("Failed to get todos"));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteAllTodos() async {
    try {
      final results = await todoDatabaseHelper.deleteAllTodos();
      return right(results);
    } catch (e) {
      return left(Failure("Failed to delete all todos"));
    }
  }
}
