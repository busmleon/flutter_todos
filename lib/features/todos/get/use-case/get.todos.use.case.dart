import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/abstract.error.dart';
import '../../../../core/models/abstract.model.dart';
import '../../../../core/models/todo.list.model.dart';
import '../repository/abstract.get.todos.repository.dart';
import 'abstract.get.todos.use.case.dart';

class GetTodosUseCase extends AbstractGetTodosUseCase {
  final AbstractGetTodosRepository repository;

  const GetTodosUseCase({@required this.repository})
      : assert(repository != null);

  @override
  Future<Either<AbstractError, TodoListModel>> call({AbstractModel param}) {
    return this.repository.getTodos();
  }
}
