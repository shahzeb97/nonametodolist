import 'package:flutter/material.dart';
import 'package:nonametodolist/state/todo_model.dart';
import 'package:provider/provider.dart';
import 'package:nonametodolist/screens/new_todo.dart';
import 'package:nonametodolist/models/todo.dart';
import 'package:nonametodolist/screens/edit_todo.dart';

class TodoArguments {
  final int todoId;

  TodoArguments(this.todoId);
}

class TodoScreen extends StatelessWidget {
  const TodoScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Replace this with TodoList() to get original functionality back
      body: CustomScrollView(
        slivers: <Widget>[TodoAppBar(), TodoList()],
      ),
      floatingActionButton: NewTodoFloatingActionButton(),
    );
  }
}

// APP BAR
class TodoAppBar extends StatelessWidget {
  const TodoAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        'todo list',
        style: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          color: Color(0xff121212),
        ),
      ),
      flexibleSpace: Padding(
        padding: const EdgeInsets.fromLTRB(18, 90, 0, 0),
        child: Text(
          'may contain tasks',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      floating: true,
      pinned: true,
      expandedHeight: 90,
      backgroundColor: Color(0xffFBDE00),
    );
  }
}

// MAIN LIST
class TodoList extends StatelessWidget {
  const TodoList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(
      builder: (context, todoList, child) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return TodoItem(
              todo: todoList.todos[index],
              toggleFunc: todoList.toggle,
            );
          },
          childCount: todoList.todos.length,
        ),
      ),
    );
  }
}

// SINGLE ITEM
class TodoItem extends StatelessWidget {
  final Todo todo;
  final toggleFunc;

  const TodoItem({
    Key key,
    this.todo,
    this.toggleFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
              value: todo.isDone,
              onChanged: (bool newValue) => toggleFunc(todo.id)),
          Expanded(
            child: InkWell(
              highlightColor: Color(0x33121212),
              onLongPress: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return EditTodoModalForm(
                      todo: todo,
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 6, 12, 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        decoration:
                            todo.isDone ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    Text(
                      todo.details,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        decoration:
                            todo.isDone ? TextDecoration.lineThrough : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// FLOATING ACTION BUTTON
class NewTodoFloatingActionButton extends StatelessWidget {
  const NewTodoFloatingActionButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return NewTodoModalForm();
          },
        );
      },
    );
  }
}
