import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'entities/abstract.entity.dart';
import 'errors.dart';

@immutable
abstract class AbstractUseCase<I extends AbstractEntity,
    O extends Future<Either<AbstractError, AbstractEntity>>> {
  const AbstractUseCase();

  // O Rückgabewert (Output) - I (Input) Eingabewert
  O call({I param});
}
