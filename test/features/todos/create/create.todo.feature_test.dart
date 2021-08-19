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

  test('should call the data source to create a todo', () async {
    //! arrange
    final fixture = const TodoModel(id: '1', description: 'Todo 1');
    final mockTodoModel = const TodoModel(description: 'Todo 1');
    when(dataSource.createTodo(mockTodoModel)).thenAnswer((_) async => fixture);
    //! act
    final result =
        await useCase.execute(param: TodoEntity.fromModel(mockTodoModel));
    //! assert
    expect(result, Right(TodoEntity.fromModel(fixture)));
    verify(dataSource.createTodo(mockTodoModel));
    verifyNoMoreInteractions(dataSource);
  });

  test('should return InvalidInputError when TodoEntity is null', () async {
    //! act
    final result = await useCase.execute(param: null);
    //! assert
    expect(result.isLeft(), true);
    result.fold((l) => expect(l, isA<InvalidInputError>()), (r) => null);
  });

  test('should return InvalidInputError if description is null', () async {
    //! arrange
    final fixture = const TodoEntity(description: null);
    //! act
    final result = await useCase.execute(param: fixture);
    //! assert
    expect(result.isLeft(), true);
    result.fold((l) => expect(l, isA<InvalidInputError>()), (r) => null);
  });

  test(
      'should return a CreateTodoError when TodoModel gotten from the datasource is null',
      () async {
    //! arrange
    final mockTodoModel = const TodoModel(description: 'Todo 1');
    when(dataSource.createTodo(mockTodoModel)).thenAnswer((_) async => null);
    //! act
    final result =
        await useCase.execute(param: TodoEntity.fromModel(mockTodoModel));
    //! assert
    expect(result.isLeft(), true);
    result.fold((l) => expect(l, isA<CreateTodoError>()), (r) => null);
    verify(dataSource.createTodo(mockTodoModel));
    verifyNoMoreInteractions(dataSource);
  });

  test(
      'should return a CreateTodoError when TodoModel.id gotten from the datasource is null',
      () async {
    //! arrange
    final fixture = const TodoModel(id: null, description: 'Todo 1');
    final mockTodoModel = const TodoModel(description: 'Todo 1');
    when(dataSource.createTodo(mockTodoModel)).thenAnswer((_) async => fixture);
    //! act
    final result =
        await useCase.execute(param: TodoEntity.fromModel(mockTodoModel));
    //! assert
    expect(result.isLeft(), true);
    result.fold((l) => expect(l, isA<CreateTodoError>()), (r) => null);
    verify(dataSource.createTodo(mockTodoModel));
    verifyNoMoreInteractions(dataSource);
  });

  test(
      'should return a CreateTodoError when TodoModel.description gotten from the datasource is null',
      () async {
    //! arrange
    final fixture = const TodoModel(id: '1', description: null);
    final mockTodoModel = const TodoModel(description: 'Todo 1');
    when(dataSource.createTodo(mockTodoModel)).thenAnswer((_) async => fixture);
    //! act
    final result =
        await useCase.execute(param: TodoEntity.fromModel(mockTodoModel));
    //! assert
    expect(result.isLeft(), true);
    result.fold((l) => expect(l, isA<CreateTodoError>()), (r) => null);
    verify(dataSource.createTodo(mockTodoModel));
    verifyNoMoreInteractions(dataSource);
  });

  test('should get GenericError if creating a todo fails in general', () async {
    //! arrange
    final mockTodoModel = const TodoModel(description: 'Todo 1');
    when(dataSource.createTodo(mockTodoModel)).thenThrow(() => Exception());
    //! act
    final result =
        await useCase.execute(param: TodoEntity.fromModel(mockTodoModel));
    //! assert
    expect(result.isLeft(), true);
    result.fold((l) => expect(l, isA<CreateTodoError>()), (r) => null);
    verify(dataSource.createTodo(mockTodoModel));
    verifyNoMoreInteractions(dataSource);
  });
}
