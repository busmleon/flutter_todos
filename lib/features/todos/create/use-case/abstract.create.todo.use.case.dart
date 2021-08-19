import 'package:dartz/dartz.dart';

import '../../../../core/abstract.use.case.dart';
import '../../../../core/errors.dart';
import '../../entities/todo.entity.dart';

abstract class AbstractCreateTodoUseCase extends AbstractUseCase<TodoEntity,
    Future<Either<AbstractError, TodoEntity>>> {
  const AbstractCreateTodoUseCase();
}
