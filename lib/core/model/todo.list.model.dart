import 'package:meta/meta.dart';

import 'abstract.model.dart';
import 'todo.model.dart';

class TodoListModel extends AbstractModel {
  final List<TodoModel> items;

  const TodoListModel({
    @required List<TodoModel> items,
  })  : assert(items != null),
        this.items = items;

  @override
  List<Object> get props => [this.items];
}
