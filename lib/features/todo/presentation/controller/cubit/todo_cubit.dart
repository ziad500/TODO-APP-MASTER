import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/status.dart';
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
          emit(AddTodoErrorState(l.message));
        }, (r) {
          allTodos.insert(0, r);
          unDoneTodos.insert(0, r);
          emit(AddTodoSuccessState());
        }));
  }

  Future deleteAllTodos() async {
    emit(AddTodoLoadingState());
    await deleteALLTodosUsecase.execude().then((value) => value.fold((l) {
          emit(AddTodoErrorState(l.message));
        }, (r) {
          emit(AddTodoSuccessState());
        }));
  }

  Future editTodo(TodoModel todoModel) async {
    emit(EditTodoLoadingState());
    await editTodosUsecase.execude(todoModel).then((value) => value.fold((l) {
          emit(EditTodoErrorState(l.message));
        }, (r) {
          editTaskImpl(todoModel, r.status);
          emit(EditTodoSuccessState());
        }));
  }

  void editTaskImpl(TodoModel todoModel, String newStatus) {
    if (newStatus == Status.done) {
      unDoneTodos.removeWhere((element) => element.id == todoModel.id);
      doneTodos.insert(0, todoModel);
    } else {
      doneTodos.removeWhere((element) => element.id == todoModel.id);
      unDoneTodos.insert(0, todoModel);
    }
    int index = allTodos.indexWhere((element) => element.id == todoModel.id);
    allTodos[index].status = newStatus;
  }

  Future deleteTodo(String todoId) async {
    emit(DeleteTodoLoadingState());
    await deleteTodosUsecase.execude(todoId).then((value) => value.fold((l) {
          emit(DeleteTodoErrorState(l.message));
        }, (r) {
          emit(DeleteTodoSuccessState());
        }));
  }

  List<TodoModel> allTodos = [];
  List<TodoModel> doneTodos = [];
  List<TodoModel> unDoneTodos = [];

  Future getAllTodos() async {
    emit(GetAllTodosLoadingState());
    await getTodosUsecase.execude().then((value) => value.fold((l) {
          emit(GetAllTodosErrorState(l.message));
        }, (r) {
          if (r.isNotEmpty) {
            allTodos = r.reversed.toList();
            doneTodos = r.reversed.where((element) => element.status == Status.done).toList();
            unDoneTodos = r.reversed.where((element) => element.status == Status.unDone).toList();
          }

          emit(GetAllTodosSuccessState());
        }));
  }
}
