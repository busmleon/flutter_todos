import 'abstract.error.dart';

class GenericError extends AbstractError {
  const GenericError({
    String message = '',
  }) : super(message: message);

  @override
  List<Object> get props => [this.message];
}
