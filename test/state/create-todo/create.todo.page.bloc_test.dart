import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/core/errors.dart';
import 'package:flutter_todos/features/todos/create/use-case/abstract.create.todo.use.case.dart';
import 'package:flutter_todos/features/todos/entities/todo.entity.dart';
import 'package:flutter_todos/states/create-todo/create.todo.page.bloc.dart';
import 'package:mockito/mockito.dart';

class _MockCreateTodoUseCase extends Mock implements AbstractCreateTodoUseCase {
}

void main() {
  CreatePageBloc bloc;
  AbstractCreateTodoUseCase createTodoUseCase;

  setUp(() {
    createTodoUseCase = _MockCreateTodoUseCase();
    bloc = CreatePageBloc(createTodoUseCase: createTodoUseCase);
  });

  test('initial state should be CreatePageInitial', () {
    //! assert
    expect(bloc.state, const CreatePageInitial());
  });

  group('CreateTodosUseCase', () {
    TodoEntity fixture;
    TodoEntity mockTodoEntity;

    setUp(() {
      mockTodoEntity = const TodoEntity(description: 'Todo 1');
      fixture = const TodoEntity(id: '1', description: 'Todo 1');
    });

    test('should create use case with data', () async {
      //! arrange
      when(createTodoUseCase.execute(param: mockTodoEntity))
          .thenAnswer((_) async => Right(fixture));
      //! act
      bloc.add(CreateTodoPageEvent(todoEntity: mockTodoEntity));
      //! assert
      await untilCalled(createTodoUseCase.execute(param: mockTodoEntity));
    });

    test(
        'should emit CreatePageTodoCreated when todos are created successfully',
        () {
      //! arrange
      when(createTodoUseCase.execute(param: mockTodoEntity))
          .thenAnswer((_) async => Right(fixture));
      final expected = [
        const CreatePageTodoLoading(),
        CreatePageTodoCreated(todo: fixture)
      ];
      //! assert later
      expectLater(bloc.stream, emitsInOrder(expected));
      //! act
      bloc.add(CreateTodoPageEvent(todoEntity: mockTodoEntity));
    });

    test('should emit CreatePageTodoError when creating todo fails', () {
      //! arrange
      when(createTodoUseCase.execute(param: mockTodoEntity))
          .thenAnswer((_) async => Left(const CreateTodoError()));
      final expected = const [
        CreatePageTodoLoading(),
        CreatePageTodoError(error: CreateTodoError())
      ];
      //! assert later
      expectLater(bloc.stream, emitsInOrder(expected));
      //! act
      bloc.add(CreateTodoPageEvent(todoEntity: mockTodoEntity));
    });
  });
}
