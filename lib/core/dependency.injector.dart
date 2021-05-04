import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import '../features/todos/get/data-source/abstract.get.todos.data.source.dart';
import '../features/todos/get/data-source/get.todos.data.source.dart';
import '../features/todos/get/repository/abstract.get.todos.repository.dart';
import '../features/todos/get/repository/get.todos.repository.dart';
import '../features/todos/get/use-case/abstract.get.todos.use.case.dart';
import '../features/todos/get/use-case/get.todos.use.case.dart';
import '../states/home/home.page.bloc.dart';

final injector = GetIt.instance;
Future<void> init() async {
  //! Feature: GetTodos
  //* State
  injector.registerFactory(() => HomePageBloc(getTodosUseCase: injector()));
  //* Use Case
  injector.registerLazySingleton<AbstractGetTodosUseCase>(
      () => GetTodosUseCase(repository: injector()));
  //* Repository
  injector.registerLazySingleton<AbstractGetTodosRepository>(
      () => GetTodosRepository(dataSource: injector()));
  //* Data Source
  injector.registerLazySingleton<AbstractGetTodosDataSource>(
      () => GetTodosDataSource(firestore: injector()));
  //* Firebase Firestore
  injector.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  await Firebase.initializeApp();
}
