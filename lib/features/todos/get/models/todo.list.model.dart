import 'package:meta/meta.dart';

import '../../../../core/models/abstract.model.dart';
import '../../models/todo.model.dart';
import '../entities/todo.list.entity.dart';

class TodoListModel extends AbstractModel {
  final List<TodoModel> items;

  const TodoListModel({
    @required this.items,
  }) : assert(items != null);
  factory TodoListModel.fromEntity(TodoListEntity todoListEntity) =>
      TodoListModel(
          items: todoListEntity.items
              .map<TodoModel>((todoEntity) => TodoModel.fromEntity(todoEntity))
              .toList());
  @override
  List<Object> get props => [this.items];
}
