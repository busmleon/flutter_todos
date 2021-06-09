import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_todos/core/errors.dart';
import 'package:flutter_todos/features/todos/create/repository/abstract.create.todo.repository.dart';
import 'package:flutter_todos/features/todos/create/use-case/abstract.create.todo.use.case.dart';
import 'package:flutter_todos/features/todos/entities/todo.entity.dart';

class CreateTodoUseCase implements AbstractCreateTodoUseCase {
  final AbstractCreateTodoRepository repository;
  const CreateTodoUseCase({@required this.repository})
      : assert(repository != null);

  @override
  Future<Either<AbstractError, TodoEntity>> call({TodoEntity param}) =>
      this.repository.createTodo(param);
}
