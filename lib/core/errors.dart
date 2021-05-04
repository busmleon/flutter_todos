import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AbstractError extends Equatable {
  final String message;

  const AbstractError({@required this.message}) : assert(message != null);
}

class DataSourceError extends AbstractError {
  const DataSourceError({
    String message,
  }) : super(
            message:
                message ?? 'Something went wrong calling the data source.');

  @override
  List<Object> get props => [this.message];
}
