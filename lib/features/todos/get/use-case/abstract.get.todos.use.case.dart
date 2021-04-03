import 'package:dartz/dartz.dart';

import '../../../../core/abstracts/abstract.use.case.dart';
import '../../../../core/errors/abstract.error.dart';
import '../../../../core/models/abstract.model.dart';
import '../../../../core/models/todo.list.model.dart';

abstract class AbstractGetTodosUseCase extends AbstractUseCase<AbstractModel,
    Future<Either<AbstractError, TodoListModel>>> {
  const AbstractGetTodosUseCase();

  Future<Either<AbstractError, TodoListModel>> call({AbstractModel param});
}
