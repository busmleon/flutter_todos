part of 'create.todo.page.bloc.dart';

abstract class CreatePageState extends Equatable {
  const CreatePageState();
}

class CreatePageInitial extends CreatePageState {
  const CreatePageInitial();

  @override
  List<Object> get props => const [];
}

class CreatePageTodoLoading extends CreatePageState {
  const CreatePageTodoLoading();

  @override
  List<Object> get props => const [];
}

class CreatePageTodoCreated extends CreatePageState {
  final TodoEntity todo;
  const CreatePageTodoCreated({@required this.todo}) : assert(todo != null);

  @override
  List<Object> get props => [this.todo];
}

class CreatePageTodoError extends CreatePageState {
  final AbstractError error;
  const CreatePageTodoError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [this.error];
}
