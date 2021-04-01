import '../../../../core/abstract.data.source.dart';
import '../../../../core/model/todo.list.model.dart';

abstract class AbstractGetTodosDataSource extends AbstractDataSource {
  Future<TodoListModel> getTodos();
}
