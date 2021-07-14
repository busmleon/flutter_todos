import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_todos/features/todos/create/use-case/abstract.create.todo.use.case.dart';
import 'package:flutter_todos/features/todos/models/todo.model.dart';
import '../../features/todos/entities/todo.entity.dart';
import '../../core/errors.dart';
part 'create.page.event.dart';
part 'create.page.state.dart';

class CreatePageBloc extends Bloc<CreatePageEvent, CreatePageState> {
  final AbstractCreateTodoUseCase createTodoUseCase;
  CreatePageBloc({@required this.createTodoUseCase})
      : assert(createTodoUseCase != null),
        super(const CreatePageInitial());

  @override
  Stream<CreatePageState> mapEventToState(
    CreatePageEvent event,
  ) async* {
    if (event is CreateTodoPageEvent) {
      // yield const CreatePageTodoLoading();

      final errorOrTodos = await createTodoUseCase(
          param: TodoEntity.fromModel(TodoModel(description: event.props[1])));
      print('Hier EventProps ${event.props}');
      print('Hier ErrorOrTodos $errorOrTodos');
      yield errorOrTodos.fold(
        (error) => CreatePageTodoError(error: error),
        (todo) => CreatePageTodoCreated(todo: todo),
      );
    }
  }
}
