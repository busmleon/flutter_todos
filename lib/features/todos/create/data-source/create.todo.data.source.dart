import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../models/todo.model.dart';
import 'abstract-create.todo.data.source.dart';

class CreateTodoDataSource implements AbstractCreateTodoDataSource {
  final FirebaseFirestore firestore;

  const CreateTodoDataSource({@required this.firestore})
      : assert(firestore != null);

  @override
  Future<TodoModel> createTodo(TodoModel todoModel) async {
    final docRef = await this
        .firestore
        .collection(Constants.FIRESTORE_COLLECTION_TODOS)
        .add(todoModel.toMap());
    return TodoModel(id: docRef.id, description: todoModel.description);
  }
}
