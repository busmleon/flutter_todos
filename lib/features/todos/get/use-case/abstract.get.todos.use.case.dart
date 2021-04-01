import 'package:dartz/dartz.dart';

import '../../../../core/abstract.use.case.dart';
import '../../../../core/error/abstract.error.dart';
import '../../../../core/model/abstract.model.dart';
import '../../../../core/model/todo.list.model.dart';

abstract class AbstractGetTodosUseCase extends AbstractUseCase<AbstractModel,
    Future<Either<AbstractError, TodoListModel>>> {
  const AbstractGetTodosUseCase();

  Future<Either<AbstractError, TodoListModel>> call({AbstractModel param});
}
