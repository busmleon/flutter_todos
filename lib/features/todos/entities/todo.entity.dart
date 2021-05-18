import 'package:flutter/material.dart';
import '../../../core/entities/abstract.entity.dart';
import '../models/todo.model.dart';

class TodoEntity extends AbstractEntity {
  final String id;
  final String description;

  const TodoEntity({
    this.id,
    @required this.description,
  }) : assert(description != null);

  factory TodoEntity.fromModel(TodoModel todoModel) =>
      TodoEntity(id: todoModel.id, description: todoModel.description);

  @override
  List<Object> get props => [this.id, this.description];
}
