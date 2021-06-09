import 'package:dartz/dartz.dart';
import 'package:flutter_todos/core/abstract.use.case.dart';
import 'package:flutter_todos/core/errors.dart';
import 'package:flutter_todos/features/todos/entities/todo.entity.dart';

abstract class AbstractCreateTodoUseCase extends AbstractUseCase<TodoEntity,
    Future<Either<AbstractError, TodoEntity>>> {
  const AbstractCreateTodoUseCase();
}
