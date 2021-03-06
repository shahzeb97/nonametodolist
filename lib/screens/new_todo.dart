import 'package:flutter/material.dart';
import 'package:nonametodolist/models/todo.dart';
import 'package:nonametodolist/state/todo_model.dart';
import 'package:provider/provider.dart';

class NewTodoModalForm extends StatefulWidget {
  const NewTodoModalForm({
    Key key,
  }) : super(key: key);

  @override
  _NewTodoModalFormState createState() => _NewTodoModalFormState();
}

class _NewTodoModalFormState extends State<NewTodoModalForm> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final detailsController = TextEditingController();

  // Function to add todos
  void createTodo(addTodo) {
    var todo = new Todo(
      title: titleController.text,
      details: detailsController.text,
    );
    Navigator.pop(context);
    addTodo(todo);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168,
      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Color(0xffFBDE00),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black54, spreadRadius: 5)
          ]),
      child: Form(
        key: _formKey,
        child: Consumer<TodoModel>(
          builder: (context, todoModel, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextFormField(
                controller: titleController,
                autofocus: true,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
                decoration: InputDecoration(
                  hintText: 'new todo',
                ),
              ),
              TextFormField(
                controller: detailsController,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: 'new todo details',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: ElevatedButton(
                  child: Text("add"),
                  onPressed: () => createTodo(todoModel.add),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Function to dispose text editting controllers
  @override
  void dispose() {
    titleController.dispose();
    detailsController.dispose();
    super.dispose();
  }
}
