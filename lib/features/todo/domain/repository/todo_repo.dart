import 'package:dartz/dartz.dart';
import 'package:todo_app/core/failure.dart';
import 'package:todo_app/features/todo/domain/entities/todo_model.dart';

abstract class TodoRepository {
  //Add TODO
  Future<Either<Failure, TodoModel>> addTodo(TodoModel todoModel);

  //Delete TODO
  Future<Either<Failure, dynamic>> deleteTodo(String todoId);

  //Delete TODO
  Future<Either<Failure, dynamic>> deleteAllTodos();

  //Edit TODO
  Future<Either<Failure, TodoModel>> editTodo(TodoModel todoModel);

  //Get All TODO
  Future<Either<Failure, List<TodoModel>>> getAllTodos();
}
