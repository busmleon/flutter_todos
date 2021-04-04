import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/abstract.error.dart';
import '../../../../core/errors/generic.error.dart';
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
      if (todos == null) throw Error();
      return Right(await this.dataSource.getTodos());
    } on AbstractError catch (error) {
      return Left(error);
    } catch (_) {
      return Left(const GenericError());
    }
  }
}
