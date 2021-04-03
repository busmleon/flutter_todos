import 'package:dartz/dartz.dart';

import '../errors/abstract.error.dart';
import '../models/abstract.model.dart';

abstract class AbstractUseCase<I extends AbstractModel,
    O extends Future<Either<AbstractError, AbstractModel>>> {
  const AbstractUseCase();

  O call({I param});
}
