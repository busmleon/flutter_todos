import 'package:dartz/dartz.dart';
import '../entities/todo.list.entity.dart';
import 'package:meta/meta.dart';
import '../../../../core/errors.dart';
import '../data-source/abstract.get.todos.data.source.dart';
import 'abstract.get.todos.repository.dart';

class GetTodosRepository implements AbstractGetTodosRepository {
  final AbstractGetTodosDataSource dataSource;

  const GetTodosRepository({@required this.dataSource})
      : assert(dataSource != null);

  @override
  Future<Either<AbstractError, TodoListEntity>> getTodos() async {
    try {
      final todoListModel = await this.dataSource.getTodos();
      if (todoListModel?.items == null)
        throw const GetTodosError(message: 'No todos could be received.');
      return Right(TodoListEntity.fromModel(todoListModel));
    } on AbstractError catch (error) {
      return Left(error);
    } catch (error) {
      return Left(GetTodosError(message: error.toString()));
    }
  }
}
