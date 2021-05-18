import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/todo.list.model.dart';
import '../models/todo.model.dart';

import 'abstract.get.todos.data.source.dart';

class MockGetTodosDataSource implements AbstractGetTodosDataSource {
  final FirebaseFirestore firestore;

  const MockGetTodosDataSource({@required this.firestore})
      : assert(firestore != null);

  @override
  Future<TodoListModel> getTodos() async {
    final List<TodoModel> mockTodoModels = [
      new TodoModel(description: 'Description 1', id: '1'),
      new TodoModel(description: 'Description 2', id: '2')
    ];
    return Future.delayed(Duration(seconds: Random().nextInt(2) * 2),
        () => TodoListModel(items: mockTodoModels));
  }
}
