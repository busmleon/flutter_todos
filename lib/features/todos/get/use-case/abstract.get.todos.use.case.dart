import 'package:dartz/dartz.dart';
import '../../../../core/entities/abstract.entity.dart';
import '../entities/todo.list.entity.dart';

import '../../../../core/abstract.use.case.dart';
import '../../../../core/errors.dart';

abstract class AbstractGetTodosUseCase extends AbstractUseCase<AbstractEntity,
    Future<Either<AbstractError, TodoListEntity>>> {
  const AbstractGetTodosUseCase();
}
