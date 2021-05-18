import '../../../../core/entities/abstract.entity.dart';

import '../../entities/todo.entity.dart';
import '../models/todo.list.model.dart';
import 'package:meta/meta.dart';

class TodoListEntity extends AbstractEntity {
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
