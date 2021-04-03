import 'abstract.error.dart';

class NullError extends AbstractError {
  const NullError({
    String message,
  }) : super(message: message);

  @override
  List<Object> get props => [this.message];
}
