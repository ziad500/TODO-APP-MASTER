import 'package:dartz/dartz.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repo.dart';
import '../../../../core/failure.dart';

class DeleteALLTodosUsecase {
  final TodoRepository todoRepository;
  DeleteALLTodosUsecase(
    this.todoRepository,
  );

  Future<Either<Failure, dynamic>> execude() async {
    return await todoRepository.deleteAllTodos();
  }
}
