import 'package:dartz/dartz.dart';
import 'package:flutter_todos/core/errors.dart';
import 'package:flutter_todos/features/todos/entities/todo.entity.dart';

abstract class AbstractCreateTodoRepository {
  const AbstractCreateTodoRepository();
  Future<Either<AbstractError, TodoEntity>> createTodo(TodoEntity todoEntity);
}
