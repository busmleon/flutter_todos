import 'package:meta/meta.dart';

import 'abstract.model.dart';

class TodoModel extends AbstractModel {
  final int id;
  final String description;

  const TodoModel({
    this.id,
    @required this.description,
  }) : assert(description != null);

  @override
  List<Object> get props => [this.id, this.description];
}
