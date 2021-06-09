import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:flutter_todos/core/errors.dart';
import 'package:flutter_todos/features/todos/create/data-source/abstract-create.todo.data.source.dart';
import 'package:flutter_todos/features/todos/create/repository/abstract.create.todo.repository.dart';
import 'package:flutter_todos/features/todos/entities/todo.entity.dart';
import 'package:flutter_todos/features/todos/models/todo.model.dart';

class CreateTodoRepository implements AbstractCreateTodoRepository {
  final AbstractCreateTodoDataSource dataSource;

  const CreateTodoRepository({@required this.dataSource})
      : assert(dataSource != null);

  @override
  Future<Either<AbstractError, TodoEntity>> createTodo(
      TodoEntity todoEntity) async {
    try {
      if (todoEntity?.description != null) {
        final createTodoModel =
            await this.dataSource.createTodo(TodoModel.fromEntity(todoEntity));
        if (createTodoModel?.id != null &&
            createTodoModel?.description != null) {
          return Right(TodoEntity.fromModel(createTodoModel));
        }
        throw const CreateTodoError(
            message: 'Invalid data gotten from the data source.');
      }
      throw const InvalidInputError(message: 'Invalid Todo Entity');
    } on AbstractError catch (error) {
      return Left(error);
    } catch (_) {
      return Left(const CreateTodoError());
    }
  }
}
