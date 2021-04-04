import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AbstractError extends Equatable {
  final String message;

  const AbstractError({@required this.message}) : assert(message != null);
}
