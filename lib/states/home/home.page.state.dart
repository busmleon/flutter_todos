part of 'home.page.bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();
}

class HomePageInitial extends HomePageState {
  const HomePageInitial();

  @override
  List<Object> get props => const [];
}

class HomePageGetTodosLoading extends HomePageState {
  const HomePageGetTodosLoading();

  @override
  List<Object> get props => const [];
}

class HomePageGetTodosLoaded extends HomePageState {
  final TodoListEntity todos;
  const HomePageGetTodosLoaded({@required this.todos}) : assert(todos != null);

  @override
  List<Object> get props => [this.todos];
}

class HomePageGetTodosError extends HomePageState {
  final AbstractError error;
  const HomePageGetTodosError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [this.error];
}
