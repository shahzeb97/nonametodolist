import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:nonametodolist/models/todo.dart';

class TodoModel extends ChangeNotifier {
  // Internal, private list of todos
  final List<Todo> _todos = [
    Todo(
        id: 0,
        title: 'first todo',
        details: 'this is the first todo in the list'),
    Todo(
        id: 1,
        title: 'second todo',
        details: 'this is the second todo in the list'),
  ];

  // An unmodifiable view of todos in the list
  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  // Method to add todo to the list
  void add(Todo todo) {
    todo.id = todos.last.id + 1;
    _todos.add(todo);
    notifyListeners();
  }

  // Method to remove todo from the list
  void remove(int id) {
    _todos.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  // Method to toggle todo's isDone
  void toggle(int id) {
    var index = _todos.indexWhere((element) => element.id == id);
    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
  }
}
