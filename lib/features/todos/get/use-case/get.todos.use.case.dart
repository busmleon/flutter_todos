import 'package:dartz/dartz.dart';
import '../entities/todo.list.entity.dart';
import '../../../../core/errors.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/abstract.model.dart';
import '../repository/abstract.get.todos.repository.dart';
import 'abstract.get.todos.use.case.dart';

class GetTodosUseCase extends AbstractGetTodosUseCase {
  final AbstractGetTodosRepository repository;

  const GetTodosUseCase({@required this.repository})
      : assert(repository != null);

  @override
  Future<Either<AbstractError, TodoListEntity>> call({AbstractModel param}) =>
      this.repository.getTodos();
}
