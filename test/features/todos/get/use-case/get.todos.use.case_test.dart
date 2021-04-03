import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/core/errors/abstract.error.dart';
import 'package:flutter_todos/core/errors/null.error.dart';
import 'package:flutter_todos/core/models/todo.list.model.dart';
import 'package:flutter_todos/core/models/todo.model.dart';
import 'package:flutter_todos/features/todos/get/data-source/abstract.get.todos.data.source.dart';
import 'package:flutter_todos/features/todos/get/repository/abstract.get.todos.repository.dart';
import 'package:flutter_todos/features/todos/get/repository/get.todos.repository.dart';
import 'package:flutter_todos/features/todos/get/use-case/abstract.get.todos.use.case.dart';
import 'package:flutter_todos/features/todos/get/use-case/get.todos.use.case.dart';
import 'package:mockito/mockito.dart';

class MockGetTodosDataSource extends Mock
    implements AbstractGetTodosDataSource {}

void main() {
  AbstractGetTodosUseCase useCase;
  AbstractGetTodosRepository repository;
  AbstractGetTodosDataSource dataSource;
  TodoListModel fixture;

  setUp(() {
    fixture = const TodoListModel(
      items: [
        TodoModel(id: 1, description: 'Todo 1'),
      ],
    );
    dataSource = MockGetTodosDataSource();
    repository = GetTodosRepository(dataSource: dataSource);
    useCase = GetTodosUseCase(repository: repository);
  });

  test('should get todos if fetching todos is successful', () async {
    when(dataSource.getTodos()).thenAnswer((_) async => fixture);
    final result = await useCase();
    expect(result, Right(fixture));
    verify(dataSource.getTodos());
  });

  test('should get NullError if fetching todos returns null', () async {
    when(dataSource.getTodos()).thenAnswer((_) async => null);
    final result = await useCase();
    result.fold((l) => expect(l, isA<NullError>()), (r) => null);
    verify(dataSource.getTodos());
  });

  test('should get AbstractError if fetching todos fails', () async {
    when(dataSource.getTodos()).thenThrow(() => Exception());
    final result = await useCase();
    result.fold((l) => expect(l, isA<AbstractError>()), (r) => null);
    verify(dataSource.getTodos());
  });
}
