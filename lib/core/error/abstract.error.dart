import 'package:equatable/equatable.dart';

abstract class AbstractError extends Equatable {
  final String message;

  const AbstractError({
    String message,
  }) : this.message = message;
}
