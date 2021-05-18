import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/core/errors.dart';
import 'package:flutter_todos/features/todos/get/data-source/abstract.get.todos.data.source.dart';
import 'package:flutter_todos/features/todos/get/entities/todo.list.entity.dart';
import 'package:flutter_todos/features/todos/get/models/todo.list.model.dart';
import 'package:flutter_todos/features/todos/models/todo.model.dart';
import 'package:flutter_todos/features/todos/get/repository/abstract.get.todos.repository.dart';
import 'package:flutter_todos/features/todos/get/repository/get.todos.repository.dart';
import 'package:flutter_todos/features/todos/get/use-case/abstract.get.todos.use.case.dart';
import 'package:flutter_todos/features/todos/get/use-case/get.todos.use.case.dart';
import 'package:mockito/mockito.dart';

// ignore: must_be_immutable
class MockGetTodosDataSource extends Mock
    implements AbstractGetTodosDataSource {}

void main() {
  AbstractGetTodosUseCase useCase;
  AbstractGetTodosRepository repository;
  AbstractGetTodosDataSource dataSource;
  TodoListModel fixture;
  TodoListModel emptyFixture;

  setUp(() {
    fixture = const TodoListModel(
      items: [
        TodoModel(id: '1', description: 'Todo 1'),
      ],
    );
    emptyFixture = const TodoListModel(
      items: [],
    );
    dataSource = MockGetTodosDataSource();
    repository = GetTodosRepository(dataSource: dataSource);
    useCase = GetTodosUseCase(repository: repository);
  });

  test('should get todos if fetching todos is successful', () async {
    when(dataSource.getTodos()).thenAnswer((_) async => fixture);
    final result = await useCase();
    expect(result, Right(TodoListEntity.fromModel(fixture)));
    verify(dataSource.getTodos());
  });

  test('should get empty todoListModel if fetched todos are empty', () async {
    when(dataSource.getTodos()).thenAnswer((_) async => emptyFixture);
    final result = await useCase();
    expect(result, Right(TodoListEntity.fromModel(emptyFixture)));
    verify(dataSource.getTodos());
  });

  test('should get GenericError if fetching todos fails in general', () async {
    when(dataSource.getTodos()).thenThrow(() => Exception());
    final result = await useCase();
    expect(result.isLeft(), true);
    result.fold((l) => expect(l, isA<DataSourceError>()), (r) => null);
    verify(dataSource.getTodos());
  });

  test('should get GenericError if fetching todos returns null', () async {
    when(dataSource.getTodos()).thenAnswer((_) async => null);
    final result = await useCase();
    expect(result.isLeft(), true);
    result.fold((l) => expect(l, isA<DataSourceError>()), (r) => null);
    verify(dataSource.getTodos());
  });
}
