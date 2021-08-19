import 'package:cloud_firestore/cloud_firestore.dart';
import '../features/todos/create/data-source/abstract-create.todo.data.source.dart';
import '../features/todos/create/data-source/create.todo.data.source.dart';
import '../features/todos/create/repository/abstract.create.todo.repository.dart';
import '../features/todos/create/repository/create.todo.repository.dart';
import '../features/todos/create/use-case/abstract.create.todo.use.case.dart';
import '../features/todos/create/use-case/create.todo.use.case.dart';
import '../states/create-todo/create.todo.page.bloc.dart';
import '../features/todos/get/data-source/get.todos.data.source.dart';
import 'package:get_it/get_it.dart';

import '../features/todos/get/data-source/abstract.get.todos.data.source.dart';
import '../features/todos/get/repository/abstract.get.todos.repository.dart';
import '../features/todos/get/repository/get.todos.repository.dart';
import '../features/todos/get/use-case/abstract.get.todos.use.case.dart';
import '../features/todos/get/use-case/get.todos.use.case.dart';
import '../states/home/home.page.bloc.dart';

final injector = GetIt.instance;
Future<void> init() async {
  //! Feature: GetTodos
  //* State
  injector
      .registerLazySingleton(() => HomePageBloc(getTodosUseCase: injector()));
  //* Use Case
  injector.registerLazySingleton<AbstractGetTodosUseCase>(
      () => GetTodosUseCase(repository: injector()));
  //* Repository
  injector.registerLazySingleton<AbstractGetTodosRepository>(
      () => GetTodosRepository(dataSource: injector()));
  //* Data Source
  injector.registerLazySingleton<AbstractGetTodosDataSource>(
      () => GetTodosDataSource(firestore: injector()));
  // () => MockGetTodosDataSource());

  //! Feature: CreateTodo
  //* State
  injector.registerLazySingleton(
      () => CreatePageBloc(createTodoUseCase: injector()));
  //* Use Case
  injector.registerLazySingleton<AbstractCreateTodoUseCase>(
      () => CreateTodoUseCase(repository: injector()));
  //* Repository
  injector.registerLazySingleton<AbstractCreateTodoRepository>(
      () => CreateTodoRepository(dataSource: injector()));
  //* Data Source
  injector.registerLazySingleton<AbstractCreateTodoDataSource>(
      () => CreateTodoDataSource(firestore: injector()));
  //! External APIs
  injector.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
}
