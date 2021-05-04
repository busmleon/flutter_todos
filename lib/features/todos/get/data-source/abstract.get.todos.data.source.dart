import '../models/todo.list.model.dart';

abstract class AbstractGetTodosDataSource {
  const AbstractGetTodosDataSource();
  Future<TodoListModel> getTodos();
}
