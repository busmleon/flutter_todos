import 'package:dartz/dartz.dart';

import '../../../../core/abstracts/abstract.repository.dart';
import '../../../../core/errors/abstract.error.dart';
import '../../../../core/models/todo.list.model.dart';

abstract class AbstractGetTodosRepository extends AbstractRepository {
  Future<Either<AbstractError, TodoListModel>> getTodos();
}
