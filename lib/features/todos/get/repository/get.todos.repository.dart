import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/abstract.error.dart';
import '../../../../core/errors/generic.error.dart';
import '../../../../core/errors/null.error.dart';
import '../../../../core/models/todo.list.model.dart';
import '../data-source/abstract.get.todos.data.source.dart';
import 'abstract.get.todos.repository.dart';

class GetTodosRepository implements AbstractGetTodosRepository {
  final AbstractGetTodosDataSource dataSource;

  const GetTodosRepository({@required this.dataSource})
      : assert(dataSource != null);

  @override
  Future<Either<AbstractError, TodoListModel>> getTodos() async {
    try {
      final todos = await this.dataSource.getTodos();
      if (todos == null) return Left(const NullError());
      return Right(await this.dataSource.getTodos());
    } catch (e) {
      return Left(const GenericError());
    }
  }
}
