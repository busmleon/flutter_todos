import 'package:meta/meta.dart';

import 'abstract.model.dart';

class TodoModel extends AbstractModel {
  final int id;
  final String description;

  const TodoModel({
    int id,
    @required String description,
  })  : assert(description != null),
        this.id = id,
        this.description = description;

  @override
  List<Object> get props => [this.id, this.description];
}
