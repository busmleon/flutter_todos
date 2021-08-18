import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_todos/features/todos/create/use-case/abstract.create.todo.use.case.dart';
import '../../features/todos/entities/todo.entity.dart';
import '../../core/errors.dart';
part 'create.todo.page.event.dart';
part 'create.todo.page.state.dart';

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
      final errorOrTodos = await createTodoUseCase(param: event.todoEntity);
      yield errorOrTodos.fold(
        (error) => CreatePageTodoError(error: error),
        (todo) {
          print('Hier $todo');
          return CreatePageTodoCreated(todo: todo);
        },
      );
    }
  }
}
