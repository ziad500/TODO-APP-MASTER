import 'package:dartz/dartz.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repo.dart';
import '../../../../core/failure.dart';

class DeleteTodosUsecase {
  final TodoRepository todoRepository;
  DeleteTodosUsecase(
    this.todoRepository,
  );

  Future<Either<Failure, dynamic>> execude(String todoId) async {
    return await todoRepository.deleteTodo(todoId);
  }
}
