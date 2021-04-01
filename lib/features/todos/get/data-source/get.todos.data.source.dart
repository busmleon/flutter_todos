import '../../../../core/model/todo.list.model.dart';
import '../../../../core/model/todo.model.dart';
import 'abstract.get.todos.data.source.dart';

class GetTodosDataSource implements AbstractGetTodosDataSource {
  @override
  Future<TodoListModel> getTodos() {
    return Future.value(const TodoListModel(
      items: [
        TodoModel(id: 1, description: 'Todo 1'),
        TodoModel(id: 2, description: 'Todo 2'),
        TodoModel(id: 3, description: 'Todo 3'),
      ],
    ));
  }
}
