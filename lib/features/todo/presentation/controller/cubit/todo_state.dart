part of 'todo_cubit.dart';

class TodoState {}

final class TodoInitial extends TodoState {}

final class AddTodoLoadingState extends TodoState {}

final class AddTodoSuccessState extends TodoState {}

final class AddTodoErrorState extends TodoState {
  final String error;
  AddTodoErrorState(this.error);
}

final class EditTodoLoadingState extends TodoState {}

final class EditTodoSuccessState extends TodoState {}

final class EditTodoErrorState extends TodoState {
  final String error;
  EditTodoErrorState(this.error);
}

final class DeleteTodoLoadingState extends TodoState {}

final class DeleteTodoSuccessState extends TodoState {}

final class DeleteTodoErrorState extends TodoState {
  final String error;
  DeleteTodoErrorState(this.error);
}

final class GetAllTodosLoadingState extends TodoState {}

final class GetAllTodosSuccessState extends TodoState {}

final class GetAllTodosErrorState extends TodoState {
  final String error;
  GetAllTodosErrorState(this.error);
}

final class GetSearchList extends TodoState {}
