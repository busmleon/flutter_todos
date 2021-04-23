import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../models/todo.list.model.dart';
import '../models/todo.model.dart';
import 'abstract.get.todos.data.source.dart';

class GetTodosDataSource extends AbstractGetTodosDataSource {
  final FirebaseFirestore firestore;

  const GetTodosDataSource({@required this.firestore})
      : assert(firestore != null);

  @override
  Future<TodoListModel> getTodos() async {
    final documents = (await this
            .firestore
            .collection(FIRESTORE_COLLECTION_TODOS)
            .get())
        .docs; //! returns empty list if collection or documents could not been found
    return TodoListModel(
        items: documents
            .map<TodoModel>(
                (document) => TodoModel.fromFirestoreDocument(document))
            .toList());
  }
}
