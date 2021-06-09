import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AbstractError extends Equatable {
  final String message;

  const AbstractError({@required this.message}) : assert(message != null);
}

class InvalidInputError extends AbstractError {
  const InvalidInputError({
    String message,
  }) : super(message: message ?? 'Invalid input.');

  @override
  List<Object> get props => [this.message];
}

class CreateTodoError extends AbstractError {
  const CreateTodoError({
    String message,
  }) : super(
            message: message ??
                'Something went wrong calling the create todo data source.');

  @override
  List<Object> get props => [this.message];
}

class GetTodosError extends AbstractError {
  const GetTodosError({
    String message,
  }) : super(
            message: message ??
                'Something went wrong calling the get todos data source.');

  @override
  List<Object> get props => [this.message];
}
