import 'todo.entity.dart';
import '../models/todo.list.model.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/abstract.model.dart';

class TodoListEntity extends AbstractModel {
  final List<TodoEntity> items;

  const TodoListEntity({
    @required this.items,
  }) : assert(items != null);
  factory TodoListEntity.fromModel(TodoListModel todoListModel) =>
      TodoListEntity(
          items: todoListModel.items
              .map<TodoEntity>((todoModel) => TodoEntity.fromModel(todoModel))
              .toList());
  @override
  List<Object> get props => [this.items];
}
