import 'package:get_it/get_it.dart';

import '../features/todos/get/data-source/abstract.get.todos.data.source.dart';
import '../features/todos/get/data-source/get.todos.data.source.dart';
import '../features/todos/get/repository/abstract.get.todos.repository.dart';
import '../features/todos/get/repository/get.todos.repository.dart';
import '../features/todos/get/use-case/abstract.get.todos.use.case.dart';
import '../features/todos/get/use-case/get.todos.use.case.dart';
import '../states/home/home.page.bloc.dart';

final injector = GetIt.instance;
init() {
  //! Feature: GetTodos
  injector.registerFactory(() => HomePageBloc(getTodosUseCase: injector()));
  injector.registerLazySingleton<AbstractGetTodosUseCase>(
      () => GetTodosUseCase(repository: injector()));
  injector.registerLazySingleton<AbstractGetTodosRepository>(
      () => GetTodosRepository(dataSource: injector()));
  injector.registerLazySingleton<AbstractGetTodosDataSource>(
      () => GetTodosDataSource());
}
