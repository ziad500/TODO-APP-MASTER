import 'package:get_it/get_it.dart';
import 'package:todo_app/features/todo/data/database/todo_database.dart';
import 'package:todo_app/features/todo/data/repository/todo_repo_impl.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repo.dart';
import 'package:todo_app/features/todo/domain/use_cases/add_todo_usecase.dart';
import 'package:todo_app/features/todo/domain/use_cases/delete_all_Todos_usecase.dart';
import 'package:todo_app/features/todo/domain/use_cases/delete_todo_usecase.dart';
import 'package:todo_app/features/todo/domain/use_cases/edit_todo_usecase.dart';
import 'package:todo_app/features/todo/domain/use_cases/get_todos_usecase.dart';
import 'package:todo_app/features/todo/presentation/controller/cubit/todo_cubit.dart';

GetIt sl = GetIt.instance;
Future<void> initAppModule() async {
  iniTodo();
}

iniTodo() async {
  //cubit
  if (!GetIt.I.isRegistered<TodoCubit>()) {
    sl.registerFactory<TodoCubit>(
        () => TodoCubit(sl.call(), sl.call(), sl.call(), sl.call(), sl.call()));
  }

  // TodoDatabaseHelper
  if (!GetIt.I.isRegistered<TodoDatabaseHelper>()) {
    sl.registerSingleton<TodoDatabaseHelper>(TodoDatabaseHelper.instance);
  }

  //repository instance
  if (!GetIt.I.isRegistered<TodoRepository>()) {
    sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(sl.call()));
  }

  //usecase
  if (!GetIt.I.isRegistered<AddTodosUsecase>()) {
    sl.registerLazySingleton<AddTodosUsecase>(() => AddTodosUsecase(sl.call()));
  }
  if (!GetIt.I.isRegistered<EditTodosUsecase>()) {
    sl.registerLazySingleton<EditTodosUsecase>(() => EditTodosUsecase(sl.call()));
  }
  if (!GetIt.I.isRegistered<DeleteTodosUsecase>()) {
    sl.registerLazySingleton<DeleteTodosUsecase>(() => DeleteTodosUsecase(sl.call()));
  }
  if (!GetIt.I.isRegistered<GetTodosUsecase>()) {
    sl.registerLazySingleton<GetTodosUsecase>(() => GetTodosUsecase(sl.call()));
  }
  if (!GetIt.I.isRegistered<DeleteALLTodosUsecase>()) {
    sl.registerLazySingleton<DeleteALLTodosUsecase>(() => DeleteALLTodosUsecase(sl.call()));
  }
}
