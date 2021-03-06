import 'package:flutter/material.dart';
import 'package:nonametodolist/state/todo_model.dart';
import 'package:provider/provider.dart';
import 'package:nonametodolist/screens/new_todo.dart';

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
      title: Text('Floating App Bar'),
      floating: true,
      expandedHeight: 200,
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
            return Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: todoList.todos[index].isDone,
                    onChanged: (bool newValue) =>
                        todoList.toggle(todoList.todos[index].id),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 6, 12, 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            todoList.todos[index].title,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              decoration: todoList.todos[index].isDone
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          Text(
                            todoList.todos[index].details,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              decoration: todoList.todos[index].isDone
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          childCount: todoList.todos.length,
        ),
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
