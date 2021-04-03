import 'package:meta/meta.dart';

import 'abstract.model.dart';
import 'todo.model.dart';

class TodoListModel extends AbstractModel {
  final List<TodoModel> items;

  const TodoListModel({
    @required this.items,
  }) : assert(items != null);

  @override
  List<Object> get props => [this.items];
}
