import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../core/errors/abstract.error.dart';
import '../../core/models/todo.list.model.dart';
import '../../features/todos/get/use-case/abstract.get.todos.use.case.dart';

part 'home.page.event.dart';
part 'home.page.state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final AbstractGetTodosUseCase getTodosUseCase;
  HomePageBloc({@required this.getTodosUseCase})
      : assert(getTodosUseCase != null),
        super(const HomePageInitial());

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if (event is HomePageGetTodosEvent) {
      yield const HomePageGetTodosLoading();
      final errorOrTodos = await getTodosUseCase();
      yield errorOrTodos.fold(
        (error) => HomePageGetTodosError(error: error),
        (todos) => HomePageGetTodosLoaded(todos: todos),
      );
    }
  }
}
