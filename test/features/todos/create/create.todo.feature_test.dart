import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/core/errors.dart';
import 'package:flutter_todos/features/todos/create/data-source/abstract-create.todo.data.source.dart';
import 'package:flutter_todos/features/todos/create/repository/abstract.create.todo.repository.dart';
import 'package:flutter_todos/features/todos/create/repository/create.todo.repository.dart';
import 'package:flutter_todos/features/todos/create/use-case/abstract.create.todo.use.case.dart';
import 'package:flutter_todos/features/todos/create/use-case/create.todo.use.case.dart';
import 'package:flutter_todos/features/todos/entities/todo.entity.dart';
import 'package:flutter_todos/features/todos/models/todo.model.dart';

import 'package:mockito/mockito.dart';

class _MockCreateTodoDataSource extends Mock
    implements AbstractCreateTodoDataSource {}

void main() {
  AbstractCreateTodoUseCase useCase;
  AbstractCreateTodoRepository repository;
  AbstractCreateTodoDataSource dataSource;

  setUp(() {
    dataSource = _MockCreateTodoDataSource();
    repository = CreateTodoRepository(dataSource: dataSource);
    useCase = CreateTodoUseCase(repository: repository);
  });

  test('should get todos if creating todos was successful', () async {
    //! arrange
    final fixture = const TodoModel(id: '1', description: 'Todo 1');
    final mockTodoModel = const TodoModel(description: 'Todo 1');

    when(dataSource.createTodo(mockTodoModel)).thenAnswer((_) async => fixture);
    //! act
    final result = await useCase(param: TodoEntity.fromModel(mockTodoModel));
    print('Test result: $result');
    //! assert
    expect(result, Right(TodoEntity.fromModel(fixture)));
    result.fold(
        (l) => null, (r) => expect(r.description, mockTodoModel.description));
    verify(dataSource.createTodo(mockTodoModel));
    verifyNoMoreInteractions(dataSource);
  });

  test('should create todoModel if TodoModel has no id', () async {
    //! arrange
    final fixture = TodoModel(description: 'Todo 1');
    final mockTodoModel = const TodoModel(description: 'Todo 1');

    when(dataSource.createTodo(mockTodoModel)).thenAnswer((_) async => fixture);
    //! act
    final result = await useCase(param: TodoEntity.fromModel(mockTodoModel));
    //! assert
    expect(result, Right(TodoEntity.fromModel(fixture)));
    result.fold(
        (l) => null, (r) => expect(r.description, mockTodoModel.description));
    verify(dataSource.createTodo(mockTodoModel));
    verifyNoMoreInteractions(dataSource);
  });

  // test('should create InvalidInputErro if description is null', () async {
  //   //! arrange
  //       // final mockTodoModel = const TodoModel(description: null);
  //   // nicht notwendig da im repository abfangen
  //   // when(dataSource.createTodo(any)).thenAnswer((_) async => null);
  //   //! act
  //   final result = await useCase();
  //   //! assert
  //   expect(result.isLeft(), true);
  //   result.fold((l) => expect(l, isA<DataSourceError>()), (r) => null);

  //   // Das hier ist falsch
  //   verify(dataSource.createTodo(null));
  //   verifyNoMoreInteractions(dataSource);
  // });

  test('should get GenericError if creating a todo fails in general', () async {
    //! arrange
    final mockTodoModel = const TodoModel(description: 'Todo 1');
    when(dataSource.createTodo(mockTodoModel)).thenThrow(() => Exception());
    //! act
    final result = await useCase(param: TodoEntity.fromModel(mockTodoModel));
    //! assert
    expect(result.isLeft(), true);
    result.fold((l) => expect(l, isA<DataSourceError>()), (r) => null);
    verify(dataSource.createTodo(mockTodoModel));
    verifyNoMoreInteractions(dataSource);
  });
}
