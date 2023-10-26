import 'package:dartz/dartz.dart';
import 'package:todo_app/features/todo/domain/entities/todo_model.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repo.dart';
import '../../../../core/failure.dart';

class AddTodosUsecase {
  final TodoRepository todoRepository;
  AddTodosUsecase(
    this.todoRepository,
  );

  Future<Either<Failure, TodoModel>> execude(TodoModel todoModel) async {
    return await todoRepository.addTodo(todoModel);
  }
}
