import 'package:dartz/dartz.dart';

import '../../../../core/abstract.repository.dart';
import '../../../../core/error/abstract.error.dart';
import '../../../../core/model/todo.list.model.dart';

abstract class AbstractGetTodosRepository extends AbstractRepository {
  Future<Either<AbstractError, TodoListModel>> getTodos();
}
