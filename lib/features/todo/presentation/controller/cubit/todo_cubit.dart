import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/domain/entities/todo_model.dart';
import 'package:todo_app/features/todo/domain/use_cases/add_todo_usecase.dart';
import 'package:todo_app/features/todo/domain/use_cases/delete_all_Todos_usecase.dart';
import 'package:todo_app/features/todo/domain/use_cases/delete_todo_usecase.dart';
import 'package:todo_app/features/todo/domain/use_cases/edit_todo_usecase.dart';
import 'package:todo_app/features/todo/domain/use_cases/get_todos_usecase.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final AddTodosUsecase addTodosUsecase;
  final EditTodosUsecase editTodosUsecase;
  final DeleteTodosUsecase deleteTodosUsecase;
  final GetTodosUsecase getTodosUsecase;
  final DeleteALLTodosUsecase deleteALLTodosUsecase;

  TodoCubit(this.addTodosUsecase, this.editTodosUsecase, this.deleteTodosUsecase,
      this.getTodosUsecase, this.deleteALLTodosUsecase)
      : super(TodoInitial());
  static TodoCubit get(context) => BlocProvider.of(context);

  Future addTodo(TodoModel todoModel) async {
    emit(AddTodoLoadingState());
    await addTodosUsecase.execude(todoModel).then((value) => value.fold((l) {
          print(l.message);
          emit(AddTodoErrorState(l.message));
        }, (r) {
          getAllTodos();
          emit(AddTodoSuccessState());
        }));
  }

  Future deleteAllTodos() async {
    emit(AddTodoLoadingState());
    await deleteALLTodosUsecase.execude().then((value) => value.fold((l) {
          print(l.message);
          emit(AddTodoErrorState(l.message));
        }, (r) {
          print("success");
          emit(AddTodoSuccessState());
        }));
  }

  Future editTodo(TodoModel todoModel) async {
    emit(EditTodoLoadingState());
    await editTodosUsecase.execude(todoModel).then((value) => value.fold((l) {
          emit(EditTodoErrorState(l.message));
        }, (r) {
          emit(EditTodoSuccessState());
        }));
  }

  Future deleteTodo(String todoId) async {
    emit(DeleteTodoLoadingState());
    await deleteTodosUsecase.execude(todoId).then((value) => value.fold((l) {
          emit(DeleteTodoErrorState(l.message));
        }, (r) {
          emit(DeleteTodoSuccessState());
        }));
  }

  Future getAllTodos() async {
    emit(GetAllTodosLoadingState());
    await getTodosUsecase.execude().then((value) => value.fold((l) {
          emit(GetAllTodosErrorState(l.message));
        }, (r) {
          if (r.isNotEmpty) {
            print(r[0].id);
            print(r[0].title);
          }

          emit(GetAllTodosSuccessState());
        }));
  }
}
