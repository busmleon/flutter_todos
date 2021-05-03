import 'package:dartz/dartz.dart';
import '../../../../core/entities/abstract.entity.dart';
import '../entities/todo.list.entity.dart';
import '../../../../core/errors.dart';
import 'package:meta/meta.dart';

import '../repository/abstract.get.todos.repository.dart';
import 'abstract.get.todos.use.case.dart';

class GetTodosUseCase implements AbstractGetTodosUseCase {
  final AbstractGetTodosRepository repository;

  const GetTodosUseCase({@required this.repository})
      : assert(repository != null);

  @override
  Future<Either<AbstractError, TodoListEntity>> call({AbstractEntity param}) =>
      this.repository.getTodos();
}
