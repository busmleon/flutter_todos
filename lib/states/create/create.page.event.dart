part of 'create.page.bloc.dart';

abstract class CreatePageEvent extends Equatable {
  const CreatePageEvent();
}

class CreateTodoPageEvent extends CreatePageEvent {
  final TodoEntity todoEntity;
  const CreateTodoPageEvent({@required this.todoEntity});

  @override
  List<Object> get props => [this.todoEntity.id, this.todoEntity.description];
}
