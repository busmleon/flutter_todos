import '../../models/todo.model.dart';

abstract class AbstractCreateTodoDataSource {
  const AbstractCreateTodoDataSource();
  Future<TodoModel> createTodo(TodoModel todoModel);
}
