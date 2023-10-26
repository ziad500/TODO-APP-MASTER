import 'package:dartz/dartz.dart';
import 'package:todo_app/features/todo/domain/entities/todo_model.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repo.dart';
import '../../../../core/failure.dart';

class GetTodosUsecase {
  final TodoRepository todoRepository;
  GetTodosUsecase(
    this.todoRepository,
  );

  Future<Either<Failure, List<TodoModel>>> execude() async {
    return await todoRepository.getAllTodos();
  }
}
