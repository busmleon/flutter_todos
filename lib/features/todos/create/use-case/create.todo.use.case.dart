import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors.dart';
import '../../entities/todo.entity.dart';
import '../repository/abstract.create.todo.repository.dart';
import 'abstract.create.todo.use.case.dart';

class CreateTodoUseCase implements AbstractCreateTodoUseCase {
  final AbstractCreateTodoRepository repository;
  const CreateTodoUseCase({@required this.repository})
      : assert(repository != null);

  @override
  Future<Either<AbstractError, TodoEntity>> execute({TodoEntity param}) =>
      this.repository.createTodo(param);
}
