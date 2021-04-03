import '../../../../core/models/todo.list.model.dart';
import '../../../../core/models/todo.model.dart';
import 'abstract.get.todos.data.source.dart';

class GetTodosDataSource implements AbstractGetTodosDataSource {
  @override
  Future<TodoListModel> getTodos() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => const TodoListModel(
        items: [
          TodoModel(id: 1, description: 'Todo 1'),
          TodoModel(id: 2, description: 'Todo 2'),
          TodoModel(id: 3, description: 'Todo 3'),
        ],
      ),
    );
  }
}
