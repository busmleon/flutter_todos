import 'package:flutter/widgets.dart';

import '../../../features/todos/get/entities/todo.list.entity.dart';

class TodoListWidget extends StatelessWidget {
  final TodoListEntity todos;
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
      itemBuilder: (_, index) => Text(todos.items.elementAt(index).id +
          ': ' +
          todos.items.elementAt(index).description),
    );
  }
}
