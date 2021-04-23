import '../../../../core/abstracts/abstract.data.source.dart';
import '../models/todo.list.model.dart';

abstract class AbstractGetTodosDataSource extends AbstractDataSource {
  const AbstractGetTodosDataSource();
  Future<TodoListModel> getTodos();
}
