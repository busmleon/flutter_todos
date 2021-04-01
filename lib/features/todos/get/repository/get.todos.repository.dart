import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/abstract.error.dart';
import '../../../../core/error/generic.error.dart';
import '../../../../core/error/null.error.dart';
import '../../../../core/model/todo.list.model.dart';
import '../data-source/abstract.get.todos.data.source.dart';
import 'abstract.get.todos.repository.dart';

class GetTodosRepository implements AbstractGetTodosRepository {
  final AbstractGetTodosDataSource dataSource;

  const GetTodosRepository({@required this.dataSource});

  @override
  Future<Either<AbstractError, TodoListModel>> getTodos() async {
    try {
      final todos = await this.dataSource.getTodos();
      if (todos == null) return Left(new NullError());
      return Right(await this.dataSource.getTodos());
    } catch (e) {
      return Left(new GenericError());
    }
  }
}
