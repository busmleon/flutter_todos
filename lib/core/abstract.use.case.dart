import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'entities/abstract.entity.dart';
import 'errors.dart';

abstract class AbstractUseCase<I extends AbstractEntity,
    O extends Future<Either<AbstractError, AbstractEntity>>> {
  const AbstractUseCase();

  O execute({@required I param});
}
