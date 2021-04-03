import 'package:flutter/material.dart';

import '../../../core/models/todo.list.model.dart';

class TodoListWidget extends StatelessWidget {
  final TodoListModel todos;
  const TodoListWidget({
    @required this.todos,
    Key key,
  })  : assert(todos != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: todos.items.length,
      itemBuilder: (_, index) => Text(todos.items.elementAt(index).description),
    );
  }
}
