import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/core/errors.dart';
import 'package:flutter_todos/features/todos/get/data-source/abstract.get.todos.data.source.dart';
import 'package:flutter_todos/features/todos/get/entities/todo.list.entity.dart';
import 'package:flutter_todos/features/todos/get/models/todo.list.model.dart';
import 'package:flutter_todos/features/todos/get/models/todo.model.dart';
import 'package:flutter_todos/features/todos/get/repository/abstract.get.todos.repository.dart';
import 'package:flutter_todos/features/todos/get/repository/get.todos.repository.dart';
import 'package:flutter_todos/features/todos/get/use-case/abstract.get.todos.use.case.dart';
import 'package:flutter_todos/features/todos/get/use-case/get.todos.use.case.dart';
import 'package:mockito/mockito.dart';

class _MockGetTodosDataSource extends Mock
    implements AbstractGetTodosDataSource {}

void main() {
  AbstractGetTodosUseCase useCase;
  AbstractGetTodosRepository repository;
  AbstractGetTodosDataSource dataSource;

  setUp(() {
    dataSource = _MockGetTodosDataSource();
    repository = GetTodosRepository(dataSource: dataSource);
    useCase = GetTodosUseCase(repository: repository);
  });

  test('should get todos if fetching todos is successful', () async {
    //! arrange
    final fixture = const TodoListModel(
      items: [
        TodoModel(id: '1', description: 'Todo 1'),
      ],
    );
    when(dataSource.getTodos()).thenAnswer((_) async => fixture);
    //! act
    final result = await useCase();
    //! assert
    expect(result, Right(TodoListEntity.fromModel(fixture)));
    verify(dataSource.getTodos());
    verifyNoMoreInteractions(dataSource);
  });

  test('should get empty todoListModel if fetched todos are empty', () async {
    //! arrange
    final fixture = const TodoListModel(
      items: [],
    );
    when(dataSource.getTodos()).thenAnswer((_) async => fixture);
    //! act
    final result = await useCase();
    //! assert
    expect(result, Right(TodoListEntity.fromModel(fixture)));
    verify(dataSource.getTodos());
    verifyNoMoreInteractions(dataSource);
  });

  test('should get GenericError if fetching todos returns null', () async {
    //! arrange
    when(dataSource.getTodos()).thenAnswer((_) async => null);
    //! act
    final result = await useCase();
    //! assert
    expect(result.isLeft(), true);
    result.fold((l) => expect(l, isA<DataSourceError>()), (r) => null);
    verify(dataSource.getTodos());
    verifyNoMoreInteractions(dataSource);
  });

  test('should get GenericError if fetching todos fails in general', () async {
    //! arrange
    when(dataSource.getTodos()).thenThrow(() => Exception());
    //! act
    final result = await useCase();
    //! assert
    expect(result.isLeft(), true);
    result.fold((l) => expect(l, isA<DataSourceError>()), (r) => null);
    verify(dataSource.getTodos());
    verifyNoMoreInteractions(dataSource);
  });
}
