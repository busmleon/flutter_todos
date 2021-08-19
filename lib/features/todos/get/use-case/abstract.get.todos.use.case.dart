import 'package:dartz/dartz.dart';

import '../../../../core/abstract.use.case.dart';
import '../../../../core/entities/abstract.entity.dart';
import '../../../../core/errors.dart';
import '../entities/todo.list.entity.dart';

abstract class AbstractGetTodosUseCase extends AbstractUseCase<AbstractEntity,
    Future<Either<AbstractError, TodoListEntity>>> {
  const AbstractGetTodosUseCase();
  Future<Either<AbstractError, TodoListEntity>> execute({AbstractEntity param});
}
