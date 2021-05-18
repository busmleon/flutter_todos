import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AbstractError extends Equatable {
  final String message;

  const AbstractError({@required this.message}) : assert(message != null);
}

class DataSourceError extends AbstractError {
  const DataSourceError({
    String message = 'Something went wrong calling the data source.',
  }) : super(message: message);

  @override
  List<Object> get props => [this.message];
}

class InvalidInputError extends AbstractError {
  const InvalidInputError({
    String message = 'Invalid input.',
  }) : super(message: message);

  @override
  List<Object> get props => [this.message];
}
