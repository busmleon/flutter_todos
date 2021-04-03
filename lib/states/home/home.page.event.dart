part of 'home.page.bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
}

class HomePageGetTodosEvent extends HomePageEvent {
  const HomePageGetTodosEvent();

  @override
  List<Object> get props => const [];
}
