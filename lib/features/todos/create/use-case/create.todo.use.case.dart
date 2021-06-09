import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors.dart';
import '../repository/abstract.create.todo.repository.dart';
import 'abstract.create.todo.use.case.dart';
import '../../entities/todo.entity.dart';

class CreateTodoUseCase implements AbstractCreateTodoUseCase {
  final AbstractCreateTodoRepository repository;
  const CreateTodoUseCase({@required this.repository})
      : assert(repository != null);

  @override
  Future<Either<AbstractError, TodoEntity>> call({TodoEntity param}) =>
      this.repository.createTodo(param);
}
