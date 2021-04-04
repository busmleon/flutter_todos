import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../core/env.vars.dart';
import '../../../../core/models/todo.list.model.dart';
import '../../../../core/models/todo.model.dart';
import 'abstract.get.todos.data.source.dart';

class GetTodosDataSource implements AbstractGetTodosDataSource {
  final FirebaseFirestore firestore;

  const GetTodosDataSource({@required this.firestore})
      : assert(firestore != null);

  @override
  Future<TodoListModel> getTodos() async {
    final documents =
        (await this.firestore.collection(FIRESTORE_COLLECTION_TODOS).get())
            .docs;
    return TodoListModel(
        items: documents
            .map<TodoModel>(
                (document) => TodoModel.fromFirestoreDocument(document))
            .toList());
  }
}
