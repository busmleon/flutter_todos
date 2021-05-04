import 'package:dartz/dartz.dart';
import '../../../../core/errors.dart';
import '../entities/todo.list.entity.dart';

abstract class AbstractGetTodosRepository {
  const AbstractGetTodosRepository();
  Future<Either<AbstractError, TodoListEntity>> getTodos();
}
