import 'package:dartz/dartz.dart';
import '../entities/todo.list.entity.dart';

import '../../../../core/abstracts/abstract.use.case.dart';
import '../../../../core/errors.dart';
import '../../../../core/models/abstract.model.dart';

abstract class AbstractGetTodosUseCase extends AbstractUseCase<AbstractModel,
    Future<Either<AbstractError, TodoListEntity>>> {
  const AbstractGetTodosUseCase();
  Future<Either<AbstractError, TodoListEntity>> call({AbstractModel param});
}
