import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/core/errors.dart';
import 'package:flutter_todos/features/todos/entities/todo.entity.dart';
import 'package:flutter_todos/features/todos/get/entities/todo.list.entity.dart';
import 'package:flutter_todos/features/todos/get/use-case/abstract.get.todos.use.case.dart';
import 'package:flutter_todos/states/home/home.page.bloc.dart';
import 'package:mockito/mockito.dart';

class _MockGetTodosUseCase extends Mock implements AbstractGetTodosUseCase {}

void main() {
  HomePageBloc bloc;
  AbstractGetTodosUseCase getTodosUseCase;

  setUp(() {
    getTodosUseCase = _MockGetTodosUseCase();
    bloc = HomePageBloc(getTodosUseCase: getTodosUseCase);
  });

  test('initial state should be HomePageInitial', () {
    //! assert
    expect(bloc.state, const HomePageInitial());
  });

  group('GetTodosUseCase', () {
    TodoListEntity fixture;

    setUp(() {
      fixture = const TodoListEntity(items: [
        TodoEntity(id: '1', description: 'Todo 1'),
      ]);
    });

    test('should get data from use case', () async {
      //! arrange
      when(getTodosUseCase()).thenAnswer((_) async => Right(fixture));
      //! act
      bloc.add(const HomePageGetTodosEvent());
      //! assert
      await untilCalled(getTodosUseCase());
    });

    test(
        'should emit [HomePageLoading, HomePageLoaded] when todos are gotten successfully',
        () {
      //! arrange
      when(getTodosUseCase()).thenAnswer((_) async => Right(fixture));
      final expected = [
        const HomePageGetTodosLoading(),
        HomePageGetTodosLoaded(todos: fixture),
      ];
      //! assert later
      print(
          'Hier BlocStream ${expectLater(bloc.stream, emitsInOrder(expected))}');
      expectLater(bloc.stream, emitsInOrder(expected));
      //! act
      bloc.add(const HomePageGetTodosEvent());
    });

    test(
        'should emit [HomePageLoading, HomePageError] when getting todos fails',
        () {
      //! arrange
      when(getTodosUseCase())
          .thenAnswer((_) async => Left(const GetTodosError()));
      final expected = const [
        HomePageGetTodosLoading(),
        HomePageGetTodosError(error: GetTodosError()),
      ];
      //! assert later
      expectLater(bloc.stream, emitsInOrder(expected));
      //! act
      bloc.add(const HomePageGetTodosEvent());
    });
  });
}
