import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../features/todos/get/entities/todo.list.entity.dart';

import '../../core/errors.dart';
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
