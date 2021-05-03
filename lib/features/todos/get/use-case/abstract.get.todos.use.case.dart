import 'package:dartz/dartz.dart';
import '../../../../core/entities/abstract.entity.dart';
import '../entities/todo.list.entity.dart';

import '../../../../core/abstracts/abstract.use.case.dart';
import '../../../../core/errors.dart';

abstract class AbstractGetTodosUseCase extends AbstractUseCase<AbstractEntity,
    Future<Either<AbstractError, TodoListEntity>>> {
  const AbstractGetTodosUseCase();
  Future<Either<AbstractError, TodoListEntity>> call({AbstractEntity param});
}
