import '../../../../core/abstracts/abstract.data.source.dart';
import '../../../../core/models/todo.list.model.dart';

abstract class AbstractGetTodosDataSource extends AbstractDataSource {
  Future<TodoListModel> getTodos();
}
