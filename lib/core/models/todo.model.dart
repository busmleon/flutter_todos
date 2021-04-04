import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import 'abstract.model.dart';

class TodoModel extends AbstractModel {
  final String id;
  final String description;

  const TodoModel({
    this.id,
    @required this.description,
  }) : assert(description != null);

  factory TodoModel.fromFirestoreDocument(QueryDocumentSnapshot document) =>
      TodoModel(
        id: document.id,
        description: document.data()['description'] ?? '',
      );

  @override
  List<Object> get props => [this.id, this.description];
}
