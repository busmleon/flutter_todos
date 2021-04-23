import 'package:dartz/dartz.dart';

import '../../../../core/abstracts/abstract.repository.dart';
import '../../../../core/errors.dart';
import '../entities/todo.list.entity.dart';

abstract class AbstractGetTodosRepository extends AbstractRepository {
  const AbstractGetTodosRepository();
  Future<Either<AbstractError, TodoListEntity>> getTodos();
}
