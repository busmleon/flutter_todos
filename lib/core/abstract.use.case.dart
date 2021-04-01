import 'package:dartz/dartz.dart';

import 'error/abstract.error.dart';
import 'model/abstract.model.dart';

abstract class AbstractUseCase<I extends AbstractModel,
    O extends Future<Either<AbstractError, AbstractModel>>> {
  const AbstractUseCase();

  O call({I param});
}
