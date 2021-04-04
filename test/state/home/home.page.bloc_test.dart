import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/core/errors/generic.error.dart';
import 'package:flutter_todos/core/models/todo.list.model.dart';
import 'package:flutter_todos/core/models/todo.model.dart';
import 'package:flutter_todos/features/todos/get/use-case/abstract.get.todos.use.case.dart';
import 'package:flutter_todos/states/home/home.page.bloc.dart';
import 'package:mockito/mockito.dart';

// ignore: must_be_immutable
class MockGetTodosUseCase extends Mock implements AbstractGetTodosUseCase {}

void main() {
  HomePageBloc bloc;
  AbstractGetTodosUseCase getTodosUseCase;

  setUp(() {
    getTodosUseCase = MockGetTodosUseCase();
    bloc = HomePageBloc(getTodosUseCase: getTodosUseCase);
  });

  test('initial state should be HomePageInitial', () {
    expect(bloc.state, const HomePageInitial());
  });

  group('GetTodosUseCase', () {
    TodoListModel fixture;

    setUp(() {
      fixture = const TodoListModel(items: [
        TodoModel(id: '1', description: 'Todo 1'),
      ]);
    });

    test('should get data from use case', () async {
      when(getTodosUseCase()).thenAnswer((_) async => Right(fixture));
      bloc.add(const HomePageGetTodosEvent());
      await untilCalled(getTodosUseCase());
      verify(getTodosUseCase());
    });

    test(
        'should emit [HomePageLoading, HomePageLoaded] when todos are gotten successfully',
        () {
      when(getTodosUseCase()).thenAnswer((_) async => Right(fixture));
      final expected = [
        const HomePageGetTodosLoading(),
        HomePageGetTodosLoaded(todos: fixture),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(const HomePageGetTodosEvent());
      // verify(getTodosUseCase());
    });

    test(
        'should emit [HomePageLoading, HomePageError] when getting todos fails',
        () {
      when(getTodosUseCase())
          .thenAnswer((_) async => Left(const GenericError()));
      final expected = const [
        HomePageGetTodosLoading(),
        HomePageGetTodosError(error: GenericError()),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(const HomePageGetTodosEvent());
    });
  });
}
