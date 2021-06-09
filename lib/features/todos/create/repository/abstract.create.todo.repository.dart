import 'package:dartz/dartz.dart';
import '../../../../core/errors.dart';
import '../../entities/todo.entity.dart';

abstract class AbstractCreateTodoRepository {
  const AbstractCreateTodoRepository();
  Future<Either<AbstractError, TodoEntity>> createTodo(TodoEntity todoEntity);
}
