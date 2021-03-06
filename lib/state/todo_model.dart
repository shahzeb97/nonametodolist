import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:nonametodolist/models/todo.dart';

class TodoModel extends ChangeNotifier {
  // Internal, private list of todos
  final List<Todo> _todos = [
    Todo(
        id: 1,
        title: 'sample todo',
        details:
            'this is a sample todo so I can see how my app looks. It will be long'),
    Todo(
        id: 2,
        title: 'sample todo',
        details:
            'this is a sample todo so I can see how my app looks. It will be long'),
    Todo(
        id: 3,
        title: 'sample todo',
        details:
            'this is a sample todo so I can see how my app looks. It will be long'),
    Todo(
        id: 4,
        title: 'sample todo',
        details:
            'this is a sample todo so I can see how my app looks. It will be long'),
    Todo(
        id: 5,
        title: 'sample todo',
        details:
            'this is a sample todo so I can see how my app looks. It will be long'),
    Todo(
        id: 6,
        title: 'sample todo',
        details:
            'this is a sample todo so I can see how my app looks. It will be long'),
    Todo(
        id: 7,
        title: 'sample todo',
        details:
            'this is a sample todo so I can see how my app looks. It will be long'),
    Todo(
        id: 8,
        title: 'sample todo',
        details:
            'this is a sample todo so I can see how my app looks. It will be long'),
    Todo(
        id: 9,
        title: 'sample todo',
        details:
            'this is a sample todo so I can see how my app looks. It will be long'),
    Todo(
        id: 10,
        title: 'sample todo',
        details:
            'this is a sample todo so I can see how my app looks. It will be long'),
    Todo(
        id: 11,
        title: 'sample todo',
        details:
            'this is a sample todo so I can see how my app looks. It will be long'),
    Todo(
        id: 12,
        title: 'sample todo',
        details:
            'this is a sample todo so I can see how my app looks. It will be long'),
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
