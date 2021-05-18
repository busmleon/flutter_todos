import 'package:flutter_todos/features/todos/models/todo.model.dart';

abstract class AbstractCreateTodoDataSource {
  const AbstractCreateTodoDataSource();
  Future<TodoModel> createTodo(TodoModel todoModel);
}
