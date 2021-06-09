import 'package:cloud_firestore/cloud_firestore.dart';
import '../entities/todo.entity.dart';
import 'package:meta/meta.dart';

import '../../../core/models/abstract.model.dart';

class TodoModel extends AbstractModel {
  final String id;
  final String description;

  const TodoModel({
    this.id,
    @required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'description': description,
    };
  }

  factory TodoModel.fromFirestoreDocument(
          QueryDocumentSnapshot<Map<String, dynamic>> document) =>
      TodoModel(
        id: document.id,
        description: document.data()['description'] ?? '',
      );

  factory TodoModel.fromEntity(TodoEntity todoEntity) =>
      TodoModel(id: todoEntity.id, description: todoEntity.description);

  @override
  List<Object> get props => [this.id, this.description];
}
