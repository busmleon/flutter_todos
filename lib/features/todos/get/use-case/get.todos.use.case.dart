import '../../../../core/model/todo.list.model.dart';
import '../../../../core/model/abstract.model.dart';
import '../../../../core/error/abstract.error.dart';
import 'package:dartz/dartz.dart';
import '../repository/abstract.get.todos.repository.dart';
import 'abstract.get.todos.use.case.dart';
import 'package:meta/meta.dart';

class GetTodosUseCase extends AbstractGetTodosUseCase {
  final AbstractGetTodosRepository repository;

  const GetTodosUseCase({@required this.repository});

  @override
  Future<Either<AbstractError, TodoListModel>> call({AbstractModel param}) {
    return this.repository.getTodos();
  }
}
